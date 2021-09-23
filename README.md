# flutter_font_awesome_web_names

The flutter_font_awesome_web_names package is developed to support [Font Awesome](https://fontawesome.com/icons) web icons names.  

The [Font Awesome](https://fontawesome.com/icons) Icon pack available as set of Flutter Icons.

Based on Font Awesome 5.15.3. Includes all free icons:

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

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon('fab fa-500px', size: 50),
            FaIcon('fab fa-twitter', size: 50),
            FaIcon('fab fa-facebook', size: 50),
            FaIcon('fab fa-instagram', size: 50),
            Container(
              width: 50,
              height: 50,
              child: FaIcon(
                'fas fa-square-full',
                alignToParent: true,
                size: 50,
                child: Container(
                  margin: EdgeInsets.only(left: 4, top: 4),
                  child: FaIcon(
                    'fas fa-cat',
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
  }
}
```

## Screenshot

<p align="center">
    <img src="https://github.com/Mythar/flutter_font_awesome_web_names/blob/master/Screenshot_1632406672.png" width=540" height="960"/>
</p>

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
