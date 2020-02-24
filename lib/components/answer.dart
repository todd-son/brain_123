import 'dart:ui';

import 'package:brain_123/views/stage.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/widgets.dart';

class Answer extends PositionComponent {
  TextPainter painter;
  TextStyle textStyle;
  Size screenSize;
  Offset position;
  Stage stage01;

  Answer(Size screenSize, Stage stage01) {
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
//    print("values : " + stage01.values.toString());

    if (stage01.values.isEmpty) {
      painter.text = TextSpan(
        text: "숫자를 순서대로 입력하세요.",
        style: textStyle,
      );
    } else {
      painter.text = TextSpan(
        text: stage01.values.fold("", (acc, s) => acc + " " + s.toString()),
        style: textStyle,
      );
    }

    painter.layout();

    position = Offset(
      screenSize.width / 2 - painter.width / 2,
      screenSize.height / 9 + 250
    );

    painter.paint(c, position);
  }

  @override
  void update(double t) {

  }
}
