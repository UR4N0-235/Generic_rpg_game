import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';

const gameOver = "game_over/kl-music-box-game-over-iii-152202.mp3";
const menu = "menu/kim-lightyear-legends-109307.mp3";
const playingGame = "playing_game/kim-lightyear-leave-the-world-tonight-chiptune-edit-loop-132102.mp3";

class Sounds {
  static Future initialize() async {
    FlameAudio.bgm.initialize();

    await FlameAudio.audioCache.loadAll([
      gameOver,
      menu,
      playingGame
    ]);
  }

  // little sounds effects
  static void gameOverSound(){
    FlameAudio.play(gameOver, volume: 1);
  }

  // background
  static stopBackgroundSound() {
    return FlameAudio.bgm.stop();
  }

  static void menuSound(){
   FlameAudio.bgm.play(menu);
  }

  static void playingGameSound(){
    FlameAudio.bgm.play(playingGame);
  }

  static void dispose(){
    FlameAudio.bgm.dispose();
  }
}