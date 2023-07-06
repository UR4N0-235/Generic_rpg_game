import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:generic_rpg_game/entities/red_demon/red_demon_sprite_sheet.dart';
import 'package:generic_rpg_game/main.dart';

class RedDemon extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, UseBarLife {
  bool canMove = true;

  RedDemon(Vector2 position)
      : super(
    position: position,
    animation: SimpleDirectionAnimation(
      idleRight: RedDemonSpriteSheet.redDemonIdleRight,
      idleLeft: RedDemonSpriteSheet.redDemonIdleLeft,
      idleUp: RedDemonSpriteSheet.redDemonIdleUp,
      idleDown: RedDemonSpriteSheet.redDemonIdleDown,
      runLeft: RedDemonSpriteSheet.redDemonWalkLeft,
      runRight: RedDemonSpriteSheet.redDemonWalkRight,
      runUp: RedDemonSpriteSheet.redDemonWalkUp,
      runDown: RedDemonSpriteSheet.redDemonWalkDown,
    ),
    speed: tileSize * 3,
    size: Vector2.all(tileSize * 2),
  ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              size.x * 0.2,
              size.y * 0.15,
            ),
            align: Vector2(tileSize * 1.15, tileSize * 1.5),
          ),
        ],
      ),
    );

    setupBarLife(
      margin: 0,
      size: Vector2(tileSize * 1.5, tileSize / 5),
      borderWidth: tileSize / 5,
      borderColor: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(2),
      barLifePosition: BarLifePorition.top,
      showLifeText: false,
      offset: Vector2(0, tileSize * -0.7),
    );
  }

  @override
  void update(double dt) {
    if (canMove) {
      seePlayer(
        radiusVision: tileSize * 6,
        observed: (redDemon) {
          followComponent(
            redDemon,
            dt,
            closeComponent: (comp) {
              _execAttack();
            },
          );
        },
        notObserved: () {
          runRandomMovement(
            dt,
            speed: speed / 3,
            maxDistance: (tileSize * 2).toInt(),
          );
        },
      );
    }
    super.update(dt);
  }

  @override
  void die() {
    canMove = false;
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (!isDead) {
      showDamage(
        damage,
        initVelocityTop: -2,
        config: const TextStyle(color: Colors.white, fontSize: tileSize / 2),
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  void _addAttackAnimation() {
    Future<SpriteAnimation> newAnimation = RedDemonSpriteSheet.redDemonAttackDown;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = RedDemonSpriteSheet.redDemonAttackLeft;
        break;
      case Direction.right:
        newAnimation = RedDemonSpriteSheet.redDemonAttackRight;
        break;
      case Direction.upLeft:
      case Direction.upRight:
      case Direction.up:
        newAnimation = RedDemonSpriteSheet.redDemonAttackUp;
        break;
      case Direction.downLeft:
      case Direction.downRight:
      case Direction.down:
        newAnimation = RedDemonSpriteSheet.redDemonAttackDown;
        break;
    }
    animation?.playOnce(
        newAnimation,
        runToTheEnd: true,
        useCompFlip: true
    );
  }

  void _execAttack() {
    simpleAttackMelee(
      damage: 10,
      size: Vector2.all(tileSize * 1.5),
      interval: 800,
      execute: _addAttackAnimation,
    );
  }
}