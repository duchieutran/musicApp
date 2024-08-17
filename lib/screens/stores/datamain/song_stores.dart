import 'package:mobx/mobx.dart';
import 'package:music/data/models/song.dart';
import 'package:music/data/services/song_services.dart';
part 'song_stores.g.dart';

class SongStores = SongStoresBase with _$SongStores;

abstract class SongStoresBase with Store {
  @observable
  ObservableList<Song> songs = ObservableList<Song>();

  @action
  Future<void> loading() async {
    try {
      final tmp = await SongServices().getData();
      songs.addAll(tmp);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> callLoadData() async {
    await loading();
  }
}
