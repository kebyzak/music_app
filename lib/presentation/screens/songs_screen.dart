import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/generated/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:music_app/presentation/blocs/song_bloc/song_bloc.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  List<String> imageUrls = [
    'https://www.righthandco.com/wp-content/uploads/2016/04/khalid-bio-300x300.jpg',
    'https://i.pinimg.com/474x/27/e6/74/27e674d4f61878d4f7e0b3ea4913445f.jpg',
    'https://i.kfs.io/artist/global/8143856,0v9/fit/300x300.jpg',
    'https://i.pinimg.com/474x/f1/1e/3b/f11e3baa2cc3eda0efa73c5446234695.jpg',
    'https://lastfm.freetls.fastly.net/i/u/300x300/462378a051090cdde996f5ffd54380a3',
    'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2Fht%2F2012%2F10%2Fbruno-mars-locked-out-of-heaven-0.jpg?w=960&cbr=1&q=90&fit=max',
    'https://www.livetracklist.com/images/the-chainsmokers-profile-300x300.jpg',
    'https://lastfm.freetls.fastly.net/i/u/300x300/0dc3ee11b05f4324c3e49b2bacbd31a8',
    'https://s3.amazonaws.com/holdenluntz.com/wp-content/uploads/20210506171725/harry-benson_mick-jagger-close-up-madison-square-garden-1-1-300x300.jpeg'
  ];

  @override
  void initState() {
    super.initState();
    context.read<SongBloc>().add(GetSongs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: Lottie.asset(
                'assets/animations/loading.json',
                width: 100,
                height: 100,
              ),
            );
          } else if (state is Success) {
            final songs = state.songs;
            return Center(
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    final song = songs[index];
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    song.title,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.orange.shade100,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    song.singer,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.orange.shade100,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    song.genre,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.orange.shade100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is Error) {
            return Center(
              child: Text(S.of(context).error),
            );
          } else {
            return Center(
              child: Text(S.of(context).unknownState),
            );
          }
        },
      ),
    );
  }
}
