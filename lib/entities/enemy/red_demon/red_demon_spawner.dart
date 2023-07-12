import 'dart:async' as async;
import 'dart:math';
// import 'dart:developer' as developer;

import 'package:bonfire/bonfire.dart';
import 'package:generic_rpg_game/entities/enemy/red_demon/red_demon.dart';
import 'package:generic_rpg_game/main.dart';

class RedDemonSpawner extends GameDecoration {

  RedDemonSpawner(Vector2 position, Vector2 size)
      : super(
      position: position,
      size: size
  ){
      _starTimeAddNewMonsters();
  }

  double doubleInRange(num start, num end) =>
      Random().nextDouble() * (end - start) + start;

  void _starTimeAddNewMonsters() {
    async.Timer.periodic(
      const Duration(milliseconds: 5000),
          (timer) {
        if (actualRedDemonsLive < maxRedDemons) {
          // developer.log('new mob at ${mobPosition.x} ${mobPosition.y}');
          gameRef.add(RedDemon(
              Vector2(
                  doubleInRange(position.x, position.x + size.x),
                  doubleInRange(position.y, position.y + size.y)
              )
            ));
          actualRedDemonsLive++;
        }
      },
    );
  }

}