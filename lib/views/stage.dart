import 'dart:math';
import 'dart:ui';

import 'package:brain_123/brain-game.dart';
import 'package:brain_123/components/answer.dart';
import 'package:brain_123/components/hint.dart';
import 'package:brain_123/components/keypad.dart';
import 'package:brain_123/components/quiz.dart';
import 'package:brain_123/components/stage-title.dart';
import 'package:brain_123/rules/rule.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/time.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class Stage extends PositionComponent with Resizable, Tapable {
  BrainGame game;
  Hint hint;
  StageTitle title;
  Quiz quizBoard;
  Answer answerBoard;
  KeyPad keyPad;
  SpriteComponent review;
  Timer hintTimer = Timer(1);
  Timer timer = Timer(2);
  Rule rule;

  bool completed = false;
  List<int> quiz = List<int>();
  List<int> input = List<int>();

  Stage(BrainGame game, Rule rule) {
    Size screenSize = game.size;
    this.game = game;
    this.rule = rule;
    hint = Hint(screenSize, rule.description());
    title = StageTitle(screenSize, game);
    generateQuiz();
    quizBoard = Quiz(screenSize, this);
    keyPad = KeyPad(screenSize, this);
    answerBoard = Answer(screenSize, this);
    hintTimer.start();
    timer.start();
  }

  void generateQuiz() {
    this.quiz = [];
    Random random = Random();
    int answerLength = 0;
    int remain = game.currentStage % game.stageOffset;

    if (remain == 0) {
      answerLength = game.stageOffset + 1;
    } else {
      answerLength = remain + 1;
    }

    for(int i = 0; i < answerLength; i++) {
      this.quiz.add(random.nextInt(9));
    }
  }

  @override
  void render(Canvas canvas) {
    if (hintTimer.isRunning()) {
      hint.render(canvas);
      canvas.restore();
      canvas.save();
    } else {
      title.render(canvas);
      canvas.restore();
      canvas.save();

      hint.render(canvas);
      canvas.restore();
      canvas.save();

      if (timer.isRunning()) {
        quizBoard.render(canvas);
        canvas.restore();
        canvas.save();
      }

      if (input.isNotEmpty) {
        answerBoard.render(canvas);
        canvas.restore();
        canvas.save();
      }

      keyPad.render(canvas);
      canvas.restore();
      canvas.save();
    }
  }

  @override
  void update(double t) {
    hintTimer.update(t);

    if (hintTimer.isFinished()) {
      timer.update(t);
    }
  }

  @override
  void onTapDown(TapDownDetails details) {
    keyPad.onTapDown(details);
  }

  void tap(KeyPadEvent event) {
    if (event.index <= 9) {
      input.add(event.index);
    }

    if (event == KeyPadEvent.Del) {
      input.removeLast();
    }

    if (event == KeyPadEvent.Esc) {
      input.clear();
      timer.start();
    }

    List<int> answer = rule.answer(quiz);

    if (listEquals(answer, input)) {
      nextStage();
    } else {
      if (input.length >= answer.length) {
        input.clear();
        timer.start();
      }
    }
  }

  void nextStage() {
    game.currentStage++;
    input = [];
    generateQuiz();
    timer.start();
  }
}
