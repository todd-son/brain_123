import 'dart:ui';

import 'package:brain_123/rules/order-rule.dart';
import 'package:brain_123/rules/reverse-order-rule.dart';
import 'package:brain_123/rules/reverse-sort-rule.dart';
import 'package:brain_123/rules/sort-rule.dart';
import 'package:brain_123/state.dart';
import 'package:brain_123/views/home.dart';
import 'package:brain_123/views/stage.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

import 'components/main-background.dart';

class BrainGame extends Game with TapDetector {
  GameState state = GameState.Init;
  MainBackground bg;
  Size size;
  Home home;
  Stage stage01;
  Stage stage02;
  Stage stage03;
  Stage stage04;
  int currentStage = 1;
  int stageOffset = 5;

  BrainGame() {
    initialize();
  }

  initialize() async {
    size = await Flame.util.initialDimensions();

    bg = MainBackground(size);
    home = Home(this);
    stage01 = Stage(this, OrderRule());
    stage02 = Stage(this, ReverseOrderRule());
    stage03 = Stage(this, SortRule());
    stage04 = Stage(this, ReverseSortRule());
  }

  started() {
    this.state = GameState.Started;
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    bg.render(canvas);
    canvas.restore();
    canvas.save();

    if (this.state == GameState.Init) {
      home.render(canvas);
    }

    if (this.state == GameState.Started &&
        this.currentStage <= this.stageOffset) {
      stage01.render(canvas);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset &&
        this.currentStage <= this.stageOffset * 2) {
      stage02.render(canvas);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset * 2 &&
        this.currentStage <= this.stageOffset * 3) {
      stage03.render(canvas);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset * 3 &&
        this.currentStage <= this.stageOffset * 4) {
      stage04.render(canvas);
    }
  }

  @override
  void update(double t) {
    if (this.state == GameState.Started &&
        this.currentStage <= this.stageOffset) {
      stage01.update(t);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset &&
        this.currentStage <= this.stageOffset * 2) {
      stage02.update(t);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset * 2 &&
        this.currentStage <= this.stageOffset * 3) {
      stage03.update(t);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset * 3 &&
        this.currentStage <= this.stageOffset * 4) {
      stage04.update(t);
    }
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (this.state == GameState.Init) {
      home.onTapDown(details);
    }

    if (this.state == GameState.Started &&
        this.currentStage <= this.stageOffset) {
      stage01.onTapDown(details);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset &&
        this.currentStage <= this.stageOffset * 2) {
      stage02.onTapDown(details);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset * 2 &&
        this.currentStage <= this.stageOffset * 3) {
      stage03.onTapDown(details);
    }

    if (this.state == GameState.Started &&
        this.currentStage > this.stageOffset * 3 &&
        this.currentStage <= this.stageOffset * 4) {
      stage04.onTapDown(details);
    }
  }
}
