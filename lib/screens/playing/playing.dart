import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/data/models/song.dart';

class Playing extends StatefulWidget {
  final Song playingSong;
  final List<Song> songs;
  const Playing({
    super.key,
    required this.songs,
    required this.playingSong,
  });

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // chú ý phần trên ní ơi
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 12));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Playing Now',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: 40,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.playingSong.album,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(
              height: 16.sp,
            ),
            const Text('_ ___ _'),
            SizedBox(
              height: 45.sp,
            ),
            Container(
              width: 0.8.sw,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular((1.sw - 0.1.sw) / 2),
                  child: FadeInImage.assetNetwork(
                    placeholder: widget.playingSong.image,
                    image: widget.playingSong.image,
                    width: 0.8.sw,
                    height: 0.8.sw,
                    // TODO : thêm ảnh nếu ảnh lỗi
                    // imageErrorBuilder: ,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.playingSong.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.playingSong.artist,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline),
                  ),
                ],
              ),
            ),
            
            // Tiếp ở đây
          ],
        ),
      ),
    );
  }
}
