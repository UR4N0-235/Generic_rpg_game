import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get playerWalkDown => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 16),
    ),
  );

  static Future<SpriteAnimation> get playerWalkUp => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 32),
    ),
  );

  static Future<SpriteAnimation> get playerWalkRight => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 48),
    ),
  );

  static Future<SpriteAnimation> get playerWalkLeft => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(16, 64),
    ),
  );


  static Future<SpriteAnimation> get playerIdleDown => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 16),
    ),
  );

  static Future<SpriteAnimation> get playerIdleUp => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 32),
    ),
  );

  static Future<SpriteAnimation> get playerIdleRight => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 48),
    ),
  );

  static Future<SpriteAnimation> get playerIdleLeft => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.3,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 64),
    ),
  );


  static Future<SpriteAnimation> get playerAttackDown => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 80),
    ),
  );

  static Future<SpriteAnimation> get playerAttackUp => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 96),
    ),
  );

  static Future<SpriteAnimation> get playerAttackRight => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 112),
    ),
  );

  static Future<SpriteAnimation> get playerAttackLeft => SpriteAnimation.load(
    'sprites/Zhinja.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(16,16),
      texturePosition: Vector2(0, 128),
    ),
  );
}