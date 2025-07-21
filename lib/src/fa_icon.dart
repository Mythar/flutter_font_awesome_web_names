library;

// Font Awesome
import 'package:flutter/material.dart';

// Import dart math
import 'dart:math' as math;

// Import icon data
import 'package:flutter_font_awesome_web_names/src/icon_data.dart';


// FaFamilyAndStyles
class FaFamilyAndStyles {

  // map
  static Map map() {
    return {
      "classic": {
        "bit": 0,
        "brands": {
          "bit": 1,
          "family": "FontAwesomeBrands",
          "patten": ["fa-brands", "fab"]
        },
        "regular": {
          "bit": 2,
          "family": "FontAwesomeRegular",
          "patten": ["fa-regular", "far"]
        },
        "light": {
          "bit": 3,
          "family": "FontAwesomeLight",
          "patten": ["fa-light", "fal"]
        },
        "thin": {
          "bit": 4,
          "family": "FontAwesomeThin",
          "patten": ["fa-thin", "fat"]
        },
        "solid": {
          "bit": 5,
          "family": "FontAwesomeSolid",
          "patten": ["fa-solid", "fas"]
        }
      },
      "duotone": {
        "bit": 6,
        "regular": {
          "bit": 7,
          "family": "FontAwesomeDuotoneRegular",
          "patten": ['fa-duotone', 'fa-regular', 'fadr']
        },
        "light": {
          "bit": 8,
          "family": "FontAwesomeDuotoneLight",
          "patten": ['fa-duotone', 'fa-light', 'fadl']
        },
        "thin": {
          "bit": 9,
          "family": "FontAwesomeDuotoneThin",
          "patten": ['fa-duotone', 'fa-thin', 'fadt']
        },
        "solid": {
          "bit": 10,
          "family": "FontAwesomeDuotoneSolid",
          "patten": ['fa-duotone', 'fa-solid', 'fads']
        }
      },
      "sharp": {
        "bit": 11,
        "regular": {
          "bit": 12,
          "family": "FontAwesomeSharpRegular",
          "patten": ['fa-sharp', 'fa-regular', 'fasr']
        },
        "light": {
          "bit": 13,
          "family": "FontAwesomeSharpLight",
          "patten": ['fa-sharp', 'fa-light', 'fasl']
        },
        "thin": {
          "bit": 14,
          "family": "FontAwesomeSharpThin",
          "patten": ['fa-sharp', 'fa-thin', 'fast']
        },
        "solid": {
          "bit": 15,
          "family": "FontAwesomeSharpSolid",
          "patten": ['fa-sharp', 'fa-solid', 'fass']
        }

      },
      "sharp-duotone": {
        "bit": 16,
        "regular": {
          "bit": 17,
          "family": "FontAwesomeSharpDuotoneRegular",
          "patten": ['fa-sharp-duotone', 'fa-regular', 'fasdr']
        },
        "light": {
          "bit": 18,
          "family": "FontAwesomeSharpDuotoneLight",
          "patten": ['fa-sharp-duotone', 'fa-light', 'fasdl']
        },
        "thin": {
          "bit": 19,
          "family": "FontAwesomeSharpDuotoneThin",
          "patten": ['fa-sharp-duotone', 'fa-thin', 'fasdt']
        },
        "solid": {
          "bit": 20,
          "family": "FontAwesomeSharpDuotoneSolid",
          "patten": ['fa-sharp-duotone', 'fa-solid', 'fasds']
        }

      }
    };
  }

  // styleExistsInStyles
  static bool styleExistsInStyles(Map styleMap, var styles) {
    String? bitString = styles?.toRadixString(2).padRight(36, '0');
    if (bitString != null) {
      if ((bitString[styleMap['style_bit']] == '1') && (bitString[styleMap['bit']] == '1')) {
        return true;
      }
    }
    return false;
  }

  // findStyleMap
  static Map findStyleMap(String style) {
    Map found = {};
    int? styleBit;
    List<String> search = style.split(' ');
    for (final entry in map().entries) {
      for (final s in entry.value.entries) {
        if (s.key != 'bit') {
          if ((s.value['patten'].first == search[0]) || (s.value['patten'].last == search[0])) {
            found = s.value;
            found['style_bit'] = styleBit;
            if (search.length > 1) {
              if (s.value['patten'].contains(search[1])) {
                found = s.value;
                found['style_bit'] = styleBit;
                break;
              }
            }
          }
        } else {
          styleBit = s.value;
        }
      }
      if (found.isNotEmpty) {
        break;
      }
    }
    return found;
  }

  // getFontFamily
  static String getFontFamily(String style) {
    Map found = findStyleMap(style);
    if (found.isNotEmpty) {
      return found['family'];
    } else {
      return 'FontAwesomeSolid';
    }
  }
}

// FaIconData
class FaIconData {
  String name;
  String unicode;
  String fontFamily;

  // Constructor
  FaIconData({required this.name, required this.unicode, required this.fontFamily});

  // Factory fromName
  factory FaIconData.fromName(String? name) {
    String iconName = 'circle-question';
    Map icon = FontAwesomeIcons.icons[iconName];
    String fontFamily = 'FontAwesomeSolid';
    String style = 'fas';
    String unicode = icon['unicode'];

    if (name != null) {
      List<String> splitName = name.toLowerCase().split(' ');
      String iconName = splitName.last.replaceAll('fa-', '');
      if (FontAwesomeIcons.icons.containsKey(iconName)) {
        icon = FontAwesomeIcons.icons[iconName];
        unicode = icon['unicode'];
        splitName.removeLast();
        style = splitName.join(' ');
        fontFamily = FaFamilyAndStyles.getFontFamily(style);
      }
    }

    return FaIconData(
      name: iconName,
      unicode: unicode,
      fontFamily: fontFamily,
    );
  }
}

// FaIcon
class FaIcon extends StatelessWidget {
  final String? name;
  final double? size;
  final Color? color;
  final Color? colorSecondary;
  final double? opacity;
  final String? semanticLabel;
  final Widget? child;
  final Alignment? alignment;
  final double? rotate;

  // Constructor
  const FaIcon(
      this.name, {
        super.key,
        this.size,
        this.color,
        this.colorSecondary,
        this.opacity,
        this.semanticLabel,
        this.child,
        this.alignment,
        this.rotate
      }
      );

  // buildIcon
  Widget buildIcon(String unicode, String fontFamily, double s, Color c) {
    return RichText(
      overflow: TextOverflow.visible,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: unicode,
        style: TextStyle(
          inherit: false,
          color: c,
          fontSize: s,
          fontFamily: fontFamily,
          package: 'flutter_font_awesome_web_names',
        ),
      ),
    );
  }

  // Override build
  @override
  Widget build(BuildContext context) {
    // Opacity and color
    final double alpha = opacity ?? 1.0;

    Color privatePrimaryColor = color ?? Theme.of(context).primaryColor;
    Color privateSecondaryColor = colorSecondary ??  Theme.of(context).primaryColorLight;

    if (alpha != 1.0) {
      privatePrimaryColor = privatePrimaryColor.withValues(alpha: privatePrimaryColor.a * alpha);
      privateSecondaryColor = privateSecondaryColor.withValues(alpha: privateSecondaryColor.a * alpha);
    }

    // Size
    double scaledSize = (size ?? 25.0);

    // Icon data
    final FaIconData data = FaIconData.fromName(name);

    // Icon widget
    Widget iconWidget;

    // Check for duo tone + child
    if (child != null) {
      if (data.fontFamily.contains('Duotone')) {
        iconWidget = Semantics(
          label: semanticLabel,
          child: ExcludeSemantics(
              child: Stack(
                children: <Widget>[
                  buildIcon(data.unicode, data.fontFamily, scaledSize, privatePrimaryColor),
                  buildIcon(data.unicode + data.unicode, data.fontFamily, scaledSize, privateSecondaryColor),
                  child!,
                ],
              )
          ),
        );
      } else {
        iconWidget = Semantics(
          label: semanticLabel,
          child: ExcludeSemantics(
              child: Stack(
                children: <Widget>[
                  buildIcon(data.unicode, data.fontFamily, scaledSize, privatePrimaryColor),
                  child!,
                ],
              )
          ),
        );
      }
    } else if (data.fontFamily.contains('Duotone')) {
      iconWidget = Semantics(
        label: semanticLabel,
        child: ExcludeSemantics(
            child: Stack(
              children: <Widget>[
                buildIcon(data.unicode, data.fontFamily, scaledSize, privatePrimaryColor),
                buildIcon(data.unicode + data.unicode, data.fontFamily, scaledSize, privateSecondaryColor),
              ],
            )
        ),
      );
    } else {
      iconWidget = Semantics(
        label: semanticLabel,
        child: ExcludeSemantics(
          child: buildIcon(data.unicode, data.fontFamily, scaledSize, privatePrimaryColor),
        ),
      );
    }

    if (alignment != null) {
      if (rotate != null) {
        return Align(
            alignment: alignment!,
            child: Transform.rotate(
              angle: rotate! * math.pi / 180,
              child: iconWidget,
            )
        );
      } else {
        return Align(
          alignment: alignment!,
          child: iconWidget,
        );
      }
    } else {
      if (rotate != null) {
        return Transform.rotate(
          angle: rotate! * math.pi / 180,
          child: iconWidget,
        );
      } else {
        return iconWidget;
      }
    }
  }
}
