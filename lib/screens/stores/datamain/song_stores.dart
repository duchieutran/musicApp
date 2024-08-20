import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:music/data/models/song.dart';
import 'package:music/data/services/song_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      await _saveUser(songs);
    } catch (e) {
      await _loadUserList();
    }
  }

// lưu dữ liệu vào bộ nhớ
  @action
  Future<void> _saveUser(List<Song> song) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String usersJson = jsonEncode(song.map((e) => e.toJSON()).toList());
    await prefs.setString('userList', usersJson);
  }

  // đọc dữ liệu từ bộ nhớ
  @action
  Future<List<Song>> _loadUserList() async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance(); 
    // Đọc chuỗi JSON từ SharedPreferences
    String? userListJson = prefs.getString('userList');
    if (userListJson != null) {
      // chuyển JSON thành Map
      List<dynamic> userListDynamic = jsonDecode(userListJson);
      List<Song> userList =
          userListDynamic.map((e) => Song.fromJSON(e)).toList();
      return userList;
    } else {
      return [];
    }
  }

  // TODO : sharepreference

  @action
  Future<void> callLoadData() async {
    await loading();
  }
}
