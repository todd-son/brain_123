import 'dart:ui';

import 'package:brain_123/brain-game.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/widgets.dart';

class StageTitle extends PositionComponent {
  BrainGame game;
  TextPainter painter;
  TextStyle textStyle;
  Size screenSize;
  Offset position;

  StageTitle(Size screenSize, BrainGame brainGame) {
    this.game = brainGame;
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Color(0xfff2f2f2),
      fontSize: 35,
      fontFamily: "JejuHallasan",
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
    );

    this.screenSize = screenSize;
  }

  @override
  void render(Canvas c) {
//    print("values : " + stage01.values.toString());

    painter.text = TextSpan(
      text: "스테이지" + game.currentStage.toString(),
      style: textStyle,
    );

    painter.layout();

    position =
        Offset(screenSize.width / 2 - painter.width / 2, screenSize.height / 9);

    painter.paint(c, position);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
