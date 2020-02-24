import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import 'brain-game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.images.loadAll(<String>[
    'bg/main_bg.png',
    'keyboard/0.png',
    'keyboard/1.png',
    'keyboard/2.png',
    'keyboard/3.png',
    'keyboard/4.png',
    'keyboard/5.png',
    'keyboard/6.png',
    'keyboard/7.png',
    'keyboard/8.png',
    'keyboard/9.png',
    'keyboard/del.png',
    'keyboard/esc.png',
    'hotkey/review.png'
  ]);

  BrainGame game = BrainGame();

  Util flameUtil = Util();

  TapGestureRecognizer tapper = TapGestureRecognizer();
//  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
  runApp(game.widget);
}


