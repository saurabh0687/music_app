import 'package:music_app/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;
  Playlist({required this.title, required this.songs, required this.imageUrl});
  static List<Playlist> playlists = [
    Playlist(
        title: "Hip-Hop R&B Mix",
        songs: Song.songs,
        imageUrl:
            "https://i1.sndcdn.com/artworks-z0ZfO3Y9bBiWjVaT-tHdcEw-t500x500.jpg"),
    Playlist(
        title: "Rock & Roll",
        songs: Song.songs,
        imageUrl:
            "https://media.istockphoto.com/id/1183921035/vector/rock-sign-gesture-with-lightning-for-your-design.jpg?s=170667a&w=is&k=20&c=7ie396_WFFHbxyPJJh4SFoHPNYFyaIt-zK_zZZN_J3U="),
    Playlist(
        title: "Techno",
        songs: Song.songs,
        imageUrl:
            "https://i.pinimg.com/originals/b2/87/19/b28719695ff6a34f7c12170dd5bf20a8.png"),
  ];
}
