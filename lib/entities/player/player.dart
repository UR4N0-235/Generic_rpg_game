import 'dart:ffi';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_rpg_game/entities/player/player_sprite_sheet.dart';
import 'package:generic_rpg_game/main.dart';


class GamePlayer extends SimplePlayer with ObjectCollision, UseBarLife{
  GamePlayer(Vector2 position): super (
    position: position,
    size: Vector2(32.0,32.0),
    life: 100,
    speed: 100,
    initDirection: Direction.down,
    animation: SimpleDirectionAnimation(
      idleLeft: PlayerSpriteSheet.playerIdleLeft,
      idleRight: PlayerSpriteSheet.playerIdleRight,
      idleUp: PlayerSpriteSheet.playerIdleUp,
      idleDown: PlayerSpriteSheet.playerIdleDown,
      runLeft: PlayerSpriteSheet.playerWalkLeft,
      runRight: PlayerSpriteSheet.playerWalkRight,
      runUp: PlayerSpriteSheet.playerWalkUp,
      runDown: PlayerSpriteSheet.playerWalkDown,
    ),
  ){
    setupCollision(
      CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
                size: Vector2(tileSize * 1.5,tileSize * 1.5),
                align: Vector2(6,6)
            ),
        ]
      )
    );
    setupBarLife(
      borderRadius: BorderRadius.circular(2),
      offset: Vector2(0, tileSize * 0.8),
      size: Vector2(tileSize * 2, tileSize / 3),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead) return;
    if ((event.id == LogicalKeyboardKey.space.keyId ||
        event.id == LogicalKeyboardKey.select.keyId ||
        event.id == 1) &&
        event.event == ActionEvent.DOWN) {
      _addAttackAnimation();
      simpleAttackMelee(
        damage: 10,
        size: Vector2.all(tileSize * 1.5),
        withPush: false,
      );
    }
    super.joystickAction(event);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic identify) {
    if (!isDead) {
      showDamage(
        damage,
        initVelocityTop: -2,
        config: const TextStyle(color: Colors.white, fontSize: tileSize / 2),
      );

      idle();
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    position = defaultPlayerSpawnPoint;
    addLife(999.0);
    super.die();
  }

  void _addAttackAnimation() {
    Future<SpriteAnimation> newAnimation = PlayerSpriteSheet.playerAttackDown;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = PlayerSpriteSheet.playerAttackLeft;
        break;
      case Direction.right:
        newAnimation = PlayerSpriteSheet.playerAttackRight;
        break;
      case Direction.upLeft:
      case Direction.upRight:
      case Direction.up:
        newAnimation = PlayerSpriteSheet.playerAttackUp;
        break;
      case Direction.downLeft:
      case Direction.downRight:
      case Direction.down:
        newAnimation = PlayerSpriteSheet.playerAttackDown;
        break;
    }
    animation?.playOnce(
        newAnimation,
        runToTheEnd: true,
        useCompFlip: true
    );
  }
}