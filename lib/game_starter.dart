import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:generic_rpg_game/entities/enemy/red_demon/red_demon_spawner.dart';
import 'package:generic_rpg_game/entities/player/player.dart';
import 'package:generic_rpg_game/utils/sounds.dart';
import 'package:generic_rpg_game/utils/variables.dart';

class Starter extends StatefulWidget{
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _Starter();
}

class _Starter extends State<Starter> {

  @override
  void initState(){
    Sounds.playingGameSound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      progress: Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Loading...',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      joystick: Joystick(
        directional: JoystickDirectional(
            spriteKnobDirectional: Sprite.load("interface/joystick.png")),
        actions: [
          JoystickAction(
              actionId: 1,
              margin: const EdgeInsets.all(65),
              sprite: Sprite.load("interface/attack.png"))
        ],
      ),
      map: WorldMapByTiled('tiled/map.json',
          forceTileSize: Vector2(32, 32),
          objectsBuilder: {
            'RedDemonSpawner': (properties) =>
                RedDemonSpawner(properties.position, properties.size),
          }),
      player: GamePlayer(defaultPlayerSpawnPoint),
      // showCollisionArea: true,
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 1.5),
      backgroundColor: const Color.fromARGB(255, 10, 53, 89),
    );
  }
}
