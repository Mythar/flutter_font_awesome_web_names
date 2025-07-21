# flutter_font_awesome_web_names

flutter_font_awesome_web_names

Based on Font Awesome 6.7.2. Includes all free icons:

  * Regular
  * Solid
  * Brands

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  flutter_font_awesome_web_names:
    git:
      url: https://github.com/Mythar/flutter_font_awesome_web_names
      ref: master
```

## Usage

```dart
import 'package:flutter_font_awesome_web_names/flutter_font_awesome.dart';

// FADemoWidget
class FADemoWidget extends StatelessWidget {

  // Constructor
  const FADemoWidget({super.key});

  // Override build
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FaIcon('fa-brands fa-500px', size: 50),
          const FaIcon('fab fa-twitter', size: 50),
          const FaIcon('fab fa-facebook', size: 50),
          const FaIcon('fa-sharp-duotone fa-solid fa-user-doctor-hair', size: 50),
          SizedBox(
            width: 50,
            height: 50,
            child: AGFaIcon(
              'fas fa-square-full',
              alignment: Alignment.center,
              size: 50,
              child: Container(
                margin: const EdgeInsets.only(left: 4, top: 4),
                child: const FaIcon(
                  'fa-duotone fa-light fa-cat',
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Screenshot

<p align="center">
    <img src="https://github.com/Mythar/flutter_font_awesome_web_names/blob/master/fa_screenshot_v6.png"/>
</p>

## Icon names

Icon names equal those on the [official website](https://fontawesome.com/icons).
This library fully supports duotone icons.

## Examples:

* "fa-brands fa-500px" (short names also supported) ~ "fab fa-500px"
* "fa-sharp-duotone fa-solid fa-user-doctor-hair" ~ "fasds fa-user-doctor-hair"
* "fa-duotone fa-light fa-cat" ~ "fadl fa-cat"

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
