// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SongStores on SongStoresBase, Store {
  late final _$songsAtom = Atom(name: 'SongStoresBase.songs', context: context);

  @override
  List<Song> get songs {
    _$songsAtom.reportRead();
    return super.songs;
  }

  @override
  set songs(List<Song> value) {
    _$songsAtom.reportWrite(value, super.songs, () {
      super.songs = value;
    });
  }

  late final _$loadingAsyncAction =
      AsyncAction('SongStoresBase.loading', context: context);

  @override
  Future<void> loading() {
    return _$loadingAsyncAction.run(() => super.loading());
  }

  @override
  String toString() {
    return '''
songs: ${songs}
    ''';
  }
}
