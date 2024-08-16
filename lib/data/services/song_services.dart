import 'package:music/config/api/api_song.dart';
import 'package:music/data/models/song.dart';
import 'package:music/data/responsitory/song_reponsitory.dart';
import 'package:music/data/source/api/rest_client.dart';

class SongServices extends SongReponsitory {
  final RestClient _restClient = RestClient(baseUrl: apiSong);
  @override
  Future<List<Song>> getData() async {
    try {
      final tmp = await _restClient.getData('/music/song.json') as Map;
      var songList = tmp['songs'] as List;
      List<Song> songs = songList.map((song) => Song.fromJSON(song)).toList();
      return songs;
    } catch (e) {
      rethrow;
    }
  }
}
