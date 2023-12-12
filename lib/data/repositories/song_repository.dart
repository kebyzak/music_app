import 'package:dio/dio.dart';
import 'package:music_app/data/repositories/song_service.dart';
import 'package:music_app/domain/song.dart';

class SongRepository {
  final SongService _songService;

  SongRepository(Dio dio) : _songService = SongService(dio);

  Future<List<Song>> getSongs() async {
    try {
      final List<Song> songs = await _songService.getSongs();
      return songs;
    } catch (e) {
      rethrow;
    }
  }
}
