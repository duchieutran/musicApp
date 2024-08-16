import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/config/routes/app_routes.dart';
import 'package:music/screens/stores/datamain/song_stores.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _store = SongStores();
  @override
  void initState() {
    _store.callLoadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        title: Text(
          '💖 MuSic App 💖',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: const [],
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface, //
      ),
      body: Observer(
          builder: (context) => ListView.builder(
                itemCount: _store.songs.length,
                itemBuilder: (context, index) {
                  final song = _store.songs[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(song.image),
                    ),
                    title: Text(
                      song.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    subtitle: Text(
                      song.artist,
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    trailing: const Icon(Icons.play_circle),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.play, arguments: {
                        'playingSong': song,
                        'songs': _store.songs
                      });
                    },
                  );
                },
              )),
    );
  }
}
