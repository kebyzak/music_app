part of 'song_bloc.dart';

abstract class SongState {}

class Initial extends SongState {}

class Loading extends SongState {}

class Success extends SongState {
  final List<Song> songs;

  Success({required this.songs});
}

class Error extends SongState {}
