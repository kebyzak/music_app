import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:music_app/domain/song.dart';

part 'song_service.g.dart';

@RestApi(
    baseUrl: 'https://my-json-server.typicode.com/ridoansaleh/my-music-api')
abstract class SongService {
  factory SongService(Dio dio, {String baseUrl}) = _SongService;

  @GET('/songs')
  Future<List<Song>> getSongs();
}
