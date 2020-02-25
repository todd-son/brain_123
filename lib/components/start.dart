import 'dart:ui';

import 'package:brain_123/brain-game.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/gestures.dart';

class Start extends TextComponent with Tapable {
  final BrainGame game;
  Start(Size screenSize, this.game) : super("연습모드") {
    this.config = TextConfig(
      fontSize: 35, color: Color(0xfff2f2f2), fontFamily: 'JejuHallasan',
    );

    this.x = screenSize.width / 2 - this.width / 2;
    this.y = screenSize.height - screenSize.height / 5;
  }

  @override
  void onTapDown(TapDownDetails details) {
    this.game.started();
  }
}
