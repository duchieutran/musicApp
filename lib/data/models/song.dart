class Song {
  final String id, title, album, artist, source, image;
  final int duration;

  Song(
      {required this.id,
      required this.title,
      required this.album,
      required this.artist,
      required this.source,
      required this.image,
      required this.duration});

  Song.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        album = json['album'],
        artist = json['artist'],
        source = json['source'],
        image = json['image'],
        duration = json['duration'];

  Map<String, dynamic> toJSON() => {
        'id': id,
        'title': title,
        'album': album,
        'artist': artist,
        'source': source,
        'image': image,
        'duration': duration
      };

  @override
  String toString() {
    return 'Song(id: $id, title: $title, album: $album, artist: $artist, source: $source, image: $image, duration: $duration)';
  }
}
