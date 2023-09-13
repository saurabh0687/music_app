import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_app/shared/api_client.dart';

class Song{

  final String title;
  final String Description;
  final String url;
  final String CoverUrl;
  Song({
 required this.title,
 required this.Description,
 required this.url,
 required this.CoverUrl
   });
   static List<Song> songs=[
     Song(
       title: "Pyar Hain tumhare",
       Description: "Pyar Hain tumhare.mp3",
       url: "assets/music/Hum Yaar Hai Tumhare 128 Kbps.mp3",
       CoverUrl: "assets/images/pyar hain tumhare.png"
     ),
      Song(
       title: "Heeriye Heeriye",
       Description: "Heeriye.mp3",
       url: "assets/music/Heeriye Heeriye.mp3.mp3",
       CoverUrl: "assets/images/heeriye.png"
     ),
      Song(
       title: "Humko tere Bina ",
       Description: " Jeena To sikha.mp3",
       url: "assets/music/Humko Tere bina Jeena to Sikha.mp3.mp3",
       CoverUrl: "assets/images/Humko tere bina.png"
     )
   ];
static Song fromJSON(dynamic map)
{
  return Song(
  url: map['previewUrl'],
  title:map['trackName'],
  CoverUrl: map['artworkUrl100'],
  Description: map['trackCensoredName']
   
  );
}

}
class SongService
{
ApiClient apiClient=ApiClient();
Future<List<Song>> getSong(String singername) async
{  
  Response response= await apiClient.get("https://itunes.apple.com/search?term=$singername&limit=25");
  print(response.data.runtimeType);
  dynamic map=jsonDecode(response.data);
  print(response.data);
  List<dynamic> list=map['results'];
  List<Song> song=list.map((e) => Song.fromJSON(e)).toList();
  print(song);
  return song;

}

}
  

