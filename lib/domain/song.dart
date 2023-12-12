class Song {
  final int id;
  final String title;
  final String genre;
  final String singer;

  Song({
    required this.id,
    required this.title,
    required this.genre,
    required this.singer,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as int,
      title: json['title'] as String,
      genre: json['genre'] as String,
      singer: json['singer'] as String,
    );
  }
}
