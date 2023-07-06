import 'package:bonfire/bonfire.dart';

class RedDemonSpriteSheet {
  static String sprite = 'sprites/demons/RedDemon.png';
  static Future<SpriteAnimation> get redDemonWalkDown => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 0),
    ),
  );

  static Future<SpriteAnimation> get redDemonWalkUp => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 16),
    ),
  );

  static Future<SpriteAnimation> get redDemonWalkRight => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 32),
    ),
  );

  static Future<SpriteAnimation> get redDemonWalkLeft => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 48),
    ),
  );


  static Future<SpriteAnimation> get redDemonIdleDown => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 0),
    ),
  );

  static Future<SpriteAnimation> get redDemonIdleUp => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 16),
    ),
  );

  static Future<SpriteAnimation> get redDemonIdleRight => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 32),
    ),
  );

  static Future<SpriteAnimation> get redDemonIdleLeft => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 48),
    ),
  );


  static Future<SpriteAnimation> get redDemonAttackDown => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 64),
    ),
  );

  static Future<SpriteAnimation> get redDemonAttackUp => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 80),
    ),
  );

  static Future<SpriteAnimation> get redDemonAttackRight => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 96),
    ),
  );

  static Future<SpriteAnimation> get redDemonAttackLeft => SpriteAnimation.load(
    sprite,
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 112),
    ),
  );
}