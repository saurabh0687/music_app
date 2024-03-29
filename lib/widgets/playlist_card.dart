import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constant/colors.dart';
import 'package:music_app/models/playlist_model.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist',arguments: playlist);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
    
          color: deepPurple.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15)
        ),
        height: 75,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(playlist.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                ),
              ),
              SizedBox( width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(playlist.title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                    Text('${playlist.songs.length} songs ',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
               
              ),
              IconButton(onPressed:() {
                
              }, icon: Icon(Icons.play_circle,color: Colors.white,))
           
            ],
           ),
      ),
    );
  }
}