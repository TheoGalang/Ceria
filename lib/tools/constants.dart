import 'package:flutter/material.dart';

// custome color
final color = MaterialColor(
  0xFF41348C,
  const <int, Color>{
    50: const Color(0xFF41348C),
    100: const Color(0xFF41348C),
    200: const Color(0xFF41348C),
    300: const Color(0xFF41348C),
    400: const Color(0xFF41348C),
    500: const Color(0xFF41348C),
    600: const Color(0xFF41348C),
    700: const Color(0xFF41348C),
    800: const Color(0xFF41348C),
    900: const Color(0xFF41348C),
  },
);

var child;

Size size = Size.zero;
double vh, vw = 0;
Orientation orientation = Orientation.portrait;

void initSize(BuildContext context) {
  MediaQueryData media = MediaQuery.of(context);
  orientation = media.orientation;
  size = media.size;
  vh = size.height > size.width ? size.height / 100 : size.width / 100;
  vw = size.height < size.width ? size.height / 100 : size.width / 100;
}
