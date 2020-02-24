import 'dart:ui';

import 'package:brain_123/brain-game.dart';
import 'package:brain_123/components/start.dart';
import 'package:brain_123/components/title.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter/gestures.dart';

class Home extends PositionComponent with Resizable, Tapable {
  Title title;
  Start start;

  Home(BrainGame game) {
    this.title = Title(game.size, "브레인123");
    this.start = Start(game.size, game);
  }

  @override
  void render(Canvas canvas) {
    this.title.render(canvas);
    canvas.restore();
    canvas.save();

    this.start.render(canvas);
    canvas.restore();
    canvas.save();
  }

  @override
  void update(double t) {
  }

  @override
  void onTapDown(TapDownDetails details) {
    this.start.onTapDown(details);
  }
}