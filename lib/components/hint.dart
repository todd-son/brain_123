import 'dart:ui';

import 'package:flame/components/text_component.dart';
import 'package:flame/text_config.dart';

class Hint extends TextComponent {
  Hint(Size screenSize, String text) : super(text) {
    this.config = TextConfig(
      fontSize: 25, color: Color(0xfff2f2f2), fontFamily: 'JejuHallasan',
    );

    this.x = screenSize.width / 2 - this.width / 2;
    this.y = screenSize.height / 9 + 100;
  }
}