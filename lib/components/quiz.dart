import 'dart:ui';

import 'package:brain_123/views/stage.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/widgets.dart';

class Quiz extends PositionComponent {
  TextPainter painter;
  TextStyle textStyle;
  Size screenSize;
  Offset position;
  Stage stage01;

  Quiz(Size screenSize, Stage stage01) {
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

    this.stage01 = stage01;
  }

  @override
  void render(Canvas c) {
    if (stage01.quiz.isEmpty) {
      painter.text = TextSpan(
        text: "숫자를 순서대로 입력하세요.",
        style: textStyle,
      );
    } else {
      painter.text = TextSpan(
        text: stage01.quiz.fold("", (acc, s) => acc + " " + s.toString()),
        style: textStyle,
      );
    }

    painter.layout();

    position = Offset(
        screenSize.width / 2 - painter.width / 2,
        screenSize.height / 9 + 150
    );

    painter.paint(c, position);
  }

  @override
  void update(double t) {}
}