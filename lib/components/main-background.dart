import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class MainBackground extends SpriteComponent {
  MainBackground(Size screenSize): super.fromSprite(screenSize.width, screenSize.height, new Sprite('bg/main_bg.png'));

  @override
  void resize(Size size) {
    this.x = 0;
    this.y = 0;
  }
}
