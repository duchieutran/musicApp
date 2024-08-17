import 'package:flutter/material.dart';
import 'package:music/data/models/song.dart';

class Playing extends StatefulWidget {
  final Song playingSong;
  final List<Song> songs;
  const Playing({super.key, required this.playingSong, required this.songs});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const Center(
        child: Text('Hieu'),
      ),
    );
  }
}
