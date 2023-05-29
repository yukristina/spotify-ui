import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/widgets/colors.dart';
import 'package:spotify_ui/widgets/widgets.dart';

class PlayListHeader extends StatelessWidget {
  PlayListHeader({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // image of lofi girl
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(
              width: 16,
            ),

            // the description
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYLIST',
                  style: TextStyle(fontSize: 12, color: whiteColor),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  playlist.name,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  playlist.description,
                  style: TextStyle(fontSize: 14, color: whiteColor),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Created by ${playlist.name} . ${playlist.songs.length} songs, ${playlist.duration}',
                  style: TextStyle(fontSize: 14, color: whiteColor),
                ),
              ],
            ))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        _PlaylistButtons(followers: playlist.followers),
        Container(
            width: double.infinity, child: TracksList(tracks: playlist.songs)),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  const _PlaylistButtons({super.key, required this.followers});

  final String followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: greenColor,
                primary: whiteColor,
                textStyle: TextStyle(
                    fontSize: 12, letterSpacing: 2, color: whiteColor)),
            onPressed: () {},
            child: Text('PLAY')),
        SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            size: 28,
            color: whiteColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            size: 28,
            color: whiteColor,
          ),
        ),
        Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 12,
            color: whiteColor,
          ),
        )
      ],
    );
  }
}
