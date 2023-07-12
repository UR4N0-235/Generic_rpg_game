import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:generic_rpg_game/entities/enemy/red_demon/red_demon_spawner.dart';
import 'package:generic_rpg_game/entities/player/player.dart';
import 'package:flutter/foundation.dart';
import 'package:generic_rpg_game/menu.dart';


const double tileSize = 16.0;
Vector2 defaultPlayerSpawnPoint = Vector2(13*tileSize,16*tileSize);

int maxRedDemons = 5;
int actualRedDemonsLive = 0;
int actualNecromancersLive = 0;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generic RPG game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Menu(),
    );
  }
}

class Starter extends StatelessWidget {
  const Starter({Key? key}) : super(key: key);

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
          spriteKnobDirectional: Sprite.load("interface/joystick.png")
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            margin: const EdgeInsets.all(65),
            sprite: Sprite.load("interface/attack.png")
          )
        ],
      ),
      map: WorldMapByTiled(
        'tiled/map.json',
        forceTileSize: Vector2(32, 32),
        objectsBuilder: {
          'RedDemonSpawner': (properties)=> RedDemonSpawner(properties.position, properties.size),
        }
      ),
      player: GamePlayer(defaultPlayerSpawnPoint),
      // showCollisionArea: true,
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 1.5),
      backgroundColor: const Color.fromARGB(255, 10, 53, 89),
    );
  }
}