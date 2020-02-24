import 'dart:ui';

import 'package:brain_123/views/stage.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class KeyPad extends PositionComponent with Tapable {
  Stage stage;
  Size screenSize;

  static double buttonSize = 60;
  SpriteComponent button1 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/1.png"));
  SpriteComponent button2 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/2.png"));
  SpriteComponent button3 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/3.png"));
  SpriteComponent button4 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/4.png"));
  SpriteComponent button5 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/5.png"));
  SpriteComponent button6 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/6.png"));
  SpriteComponent button7 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/7.png"));
  SpriteComponent button8 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/8.png"));
  SpriteComponent button9 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/9.png"));
  SpriteComponent button0 = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/0.png"));
  SpriteComponent buttonDel = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/del.png"));
  SpriteComponent buttonEsc = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("keyboard/esc.png"));
  SpriteComponent buttonReview = SpriteComponent.fromSprite(buttonSize, buttonSize, Sprite("hotkey/review.png"));

  KeyPad(Size screenSize, Stage stage) {
    this.x = screenSize.width / 2 - this.width / 2;
    this.y = screenSize.height - screenSize.height / 2.5;
    this.stage = stage;
    this.screenSize = screenSize;
  }

  @override
  void render(Canvas canvas) {
    button1.x = this.x - buttonSize / 2 - buttonSize;
    button1.y = this.y;

    button2.x = this.x - buttonSize / 2;
    button2.y = this.y;

    button3.x = this.x - buttonSize / 2 + buttonSize;
    button3.y = this.y;

    button4.x = this.x - buttonSize / 2 - buttonSize;
    button4.y = this.y + buttonSize;

    button5.x = this.x - buttonSize / 2;
    button5.y = this.y + buttonSize;

    button6.x = this.x - buttonSize / 2 + buttonSize;
    button6.y = this.y + buttonSize;

    button7.x = this.x - buttonSize / 2 - buttonSize;
    button7.y = this.y + buttonSize * 2;

    button8.x = this.x - buttonSize / 2;
    button8.y = this.y + buttonSize * 2;

    button9.x = this.x - buttonSize / 2 + buttonSize;
    button9.y = this.y + buttonSize * 2;

    buttonDel.x = this.x - buttonSize / 2 - buttonSize;
    buttonDel.y = this.y + buttonSize * 3;

    button0.x = this.x - buttonSize / 2;
    button0.y = this.y + buttonSize * 3;

    buttonEsc.x = this.x - buttonSize / 2 + buttonSize;
    buttonEsc.y = this.y + buttonSize * 3;

    buttonReview.x = this.screenSize.width - (buttonSize + 10);
    buttonReview.y = buttonSize;

    button1.render(canvas);
    canvas.restore();
    canvas.save();

    button2.render(canvas);
    canvas.restore();
    canvas.save();

    button3.render(canvas);
    canvas.restore();
    canvas.save();

    button4.render(canvas);
    canvas.restore();
    canvas.save();

    button5.render(canvas);
    canvas.restore();
    canvas.save();

    button6.render(canvas);
    canvas.restore();
    canvas.save();

    button7.render(canvas);
    canvas.restore();
    canvas.save();

    button8.render(canvas);
    canvas.restore();
    canvas.save();

    button9.render(canvas);
    canvas.restore();
    canvas.save();

    buttonDel.render(canvas);
    canvas.restore();
    canvas.save();

    button0.render(canvas);
    canvas.restore();
    canvas.save();

    buttonEsc.render(canvas);
    canvas.restore();
    canvas.save();

    buttonReview.render(canvas);
    canvas.restore();
    canvas.save();
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (button1.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.One);
    }

    if (button2.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Two);
    }

    if (button3.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Three);
    }

    if (button4.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Four);
    }

    if (button5.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Five);
    }

    if (button6.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Six);
    }

    if (button7.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Seven);
    }

    if (button8.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Eight);
    }

    if (button9.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Nine);
    }

    if(button0.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Zero);
    }

    if(buttonDel.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Del);
    }

    if(buttonEsc.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Esc);
    }

    if(buttonReview.toRect().contains(details.globalPosition)) {
      stage.tap(KeyPadEvent.Review);
    }
  }
}

enum KeyPadEvent {
  Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Del, Esc, Review
}