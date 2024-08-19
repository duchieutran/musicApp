import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/data/models/song.dart';
import 'package:music/screens/playing/audio_player_manager.dart';
import 'package:music/screens/playing/media_button_control.dart';

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
  late AudioPlayerManager _audioPlayerManager;

  @override
  void initState() {
    // chú ý phần trên ní ơi
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 12));
    _audioPlayerManager =
        AudioPlayerManager(songUrl: widget.playingSong.source);
    _audioPlayerManager.init();
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayerManager.dispose(); // tránh việc trùng lặp bài hát
    super.dispose();
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
            SizedBox(
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.playingSong.artist,
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 24,
                right: 24,
                bottom: 15,
              ),
              child: _progressBar(),
            ),
            // thanh buttoncontroller
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const MediaButtonControl(
                    function: null,
                    icon: Icons.shuffle,
                    color: Colors.black,
                    size: 24),
                const MediaButtonControl(
                    function: null,
                    icon: Icons.skip_previous,
                    color: Colors.black,
                    size: 36),
                _playButton(),
                const MediaButtonControl(
                    function: null,
                    icon: Icons.skip_next,
                    color: Colors.black,
                    size: 36),
                const MediaButtonControl(
                    function: null,
                    icon: Icons.repeat,
                    color: Colors.black,
                    size: 24),
              ],
            )
            // Tiếp ở đây
          ],
        ),
      ),
    );
  }

  // progressBar
  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _audioPlayerManager.durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          // widget thanh nhạc
          progress: progress, // thời gian đã chạy
          total: total, // tổng thời gian của thanh
          buffered: buffered, // bộ đệm
          onSeek: _audioPlayerManager.player.seek,
          // có thể đổi màu của thanh progressbar
        );
      },
    );
  }

  // play
  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder(
      stream: _audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.all(8),
            width: 48,
            height: 48,
            child: const CircularProgressIndicator(),
          );
        }
        final playState = snapshot.data;
        final processeingState = playState?.processingState;
        final playing = playState?.playing;
        // nếu đang tải dữ liệu = loading , = buffering (tải dữ liệu từ internet)
        // nếu đang không playing (đang chạy thì dùng)
        // nếu đang phát nhạc thì có nút dừng
        // có thể tua bài hát
        if (processeingState == ProcessingState.loading ||
            processeingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8),
            width: 48,
            height: 48,
            child: const CircularProgressIndicator(),
          );
        } else if (playing == true) {
          return MediaButtonControl(
              function: () {
                _audioPlayerManager.player.pause();
              },
              icon: Icons.pause,
              color: Colors.black,
              size: 40);
        } else if (processeingState != ProcessingState.completed) {
          return MediaButtonControl(
              function: () {
                _audioPlayerManager.player.play();
              },
              icon: Icons.play_arrow,
              color: Colors.black,
              size: 40);
        } else {
          return MediaButtonControl(
              function: () {
                _audioPlayerManager.player.seek(Duration.zero);
              },
              icon: Icons.replay,
              color: null,
              size: 40);
        }
      },
    );
  }
}
