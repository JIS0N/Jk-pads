import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return runApp(const MaterialApp(home: Scaffold(body: SoundBoredPage())));
}

class SoundBoredPage extends StatefulWidget {
  const SoundBoredPage({super.key});

  @override
  State<SoundBoredPage> createState() => _SoundBoredPageState();
}

class _SoundBoredPageState extends State<SoundBoredPage> {
  final List<String> soundFiles = [

    'ayoko-malupiton.mp3',
    'bigyan-ng-jacket-yan.mp3',
    'emotional-damage_svaNMfN.mp3',
    'low-cortisol-song.mp3',
    'malupiton-ano-hanap-mo-gulo.mp3',
    'malupiton-bossing-epal-ka-ba.mp3',
    'malupiton-burger-ka-sakin.mp3',
    'malupiton-tumatapang-ka.mp3',
    'pasikat-malupiton.mp3',
    'shaw-dambi.mp3',
    'vine-boom.mp3',
    'virus-indian-song.mp3',
  ];

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/${soundFiles[soundNumber - 1]}'));
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      // Green row
      _SoundButton(color: Color.fromARGB(255, 165, 237, 64), soundNumber: 1, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 123, 216, 59), soundNumber: 2, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 86, 198, 51), soundNumber: 3, onTap: playSound),
      // Tan/Orange row
      _SoundButton(color: Color.fromARGB(255, 233, 200, 135), soundNumber: 4, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 226, 165, 92), soundNumber: 5, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 219, 130, 50), soundNumber: 6, onTap: playSound),
      // Red row
      _SoundButton(color: Color.fromARGB(255, 204, 57, 49), soundNumber: 7, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 189, 87, 79), soundNumber: 8, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 214, 172, 163), soundNumber: 9, onTap: playSound),
      // Blue row
      _SoundButton(color: Color.fromARGB(255, 167, 204, 242), soundNumber: 10, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 112, 174, 229), soundNumber: 11, onTap: playSound),
      _SoundButton(color: Color.fromARGB(255, 57, 143, 216), soundNumber: 12, onTap: playSound),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Text(
              'SOUND BORED',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: buttons,
            ),
          ),
        ],
      ),
    );
  }
}

class _SoundButton extends StatelessWidget {
  final Color color;
  final int soundNumber;
  final Function(int) onTap;

  const _SoundButton({
    required this.color,
    required this.soundNumber,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(soundNumber),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }
}