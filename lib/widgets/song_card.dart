import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constant/colors.dart';
import 'package:music_app/models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/songs',arguments: song);
      },
      child: Container(
      
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:[ 
          Container(
           width: MediaQuery.of(context).size.width*0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
             image: DecorationImage(image: AssetImage(song.CoverUrl),fit: BoxFit.cover)
            ),
          ),
           Container(
            height: 50,
           width: MediaQuery.of(context).size.width*0.40,
           margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.9),
            
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(song.title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: deepPurple,fontWeight: FontWeight.bold)),
                     Text(song.Description,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold))
                  ],
                ),
                Icon(Icons.play_circle,color: deepPurple,)
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}
