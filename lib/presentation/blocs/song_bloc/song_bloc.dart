// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:music_app/data/repositories/song_repository.dart';
import 'package:music_app/domain/song.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository songRepository;

  SongBloc({required this.songRepository}) : super(Initial()) {
    on<GetSongs>((event, state) async {
      emit(Loading());
      try {
        final songs = await songRepository.getSongs();
        emit(Success(songs: songs));
      } catch (e) {
        emit(Error());
      }
    });
  }
}
