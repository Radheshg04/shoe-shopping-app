import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration currentSeek = Duration.zero;
  Duration totalSongDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://i.ytimg.com/vi/ZHc0maiy_DQ/hqdefault.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
                height: 350,
              ),
            ),
            const Text(
              "Fein",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Carti",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Slider(
              min: 0,
              max: totalSongDuration.inSeconds.toDouble(),
              value: currentSeek.inSeconds.toDouble(),
              onChanged: (value) async {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(currentSeek.inMinutes ~/ 60).toString()}:${(currentSeek.inSeconds ~/ 60).toString()}",
                    style: const TextStyle(
                        // fontSize: 020,
                        ),
                  ),
                  const ButtonBar(),
                  Text(
                    "${(totalSongDuration.inMinutes ~/ 60).toString()}:${(totalSongDuration.inSeconds ~/ 60).toString()}",
                    style: const TextStyle(
                        // fontSize: 020,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
