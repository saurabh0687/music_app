import 'package:flutter/material.dart';
import 'package:music_app/constant/colors.dart';
import 'package:music_app/models/song_model.dart';

import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/widgets/playlist_card.dart';

import 'package:music_app/widgets/section_header.dart';
import 'package:music_app/widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlist=Playlist. playlists;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        deepPurple.shade800.withOpacity(0.8),
        deepPurple.shade200.withOpacity(0.8)
      ])),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.grid_view_rounded),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                child: const CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage(
                      "https://e7.pngegg.com/pngimages/589/452/png-clipart-apple-music-festival-itunes-computer-icons-music-icon-text-logo-thumbnail.png"),
                ))
          ],
        ),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              TrendingMusic(songs: songs),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [SectionHeader(title: "Playlists"),
                  ListView.builder(
                    itemCount: playlist.length,
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20),
                //    scrollDirection: Axis.vertical,
                    itemBuilder:(context, index) {
                    return PlayListCard(playlist: playlist[index])  ;
                  },)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SectionHeader(title: "Trending Music"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: ((context, index) {
                  return SongCard(song: songs[index]);
                })),
          )
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Enjoy your favorite music",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
            
      },
        type: BottomNavigationBarType.fixed,
        backgroundColor: deepPurple.shade800,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline,
              ),
              label: "Play"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(
                
                Icons.people_outline,
              ),
              label: "Profile"),
        ]);
  }
}
