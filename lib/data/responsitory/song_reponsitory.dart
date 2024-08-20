import 'package:music/data/models/song.dart';

abstract class SongReponsitory {
  Future<List<Song>> getData();
  // TODO : thêm xoá sửa nhé
}

