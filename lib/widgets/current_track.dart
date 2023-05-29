import 'package:flutter/material.dart';
import 'package:spotify_ui/models/current_track_model.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/widgets/colors.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            _TrachInfo(),
            Spacer(),
            _PlayerControls(),
            Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrachInfo extends StatelessWidget {
  const _TrachInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'lib/assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              selected.artist,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[300]),
            ),
          ],
        ),
        SizedBox(
          width: 12,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.shuffle),
              iconSize: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
              iconSize: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.play_circle_fill_outlined),
              iconSize: 34,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
              iconSize: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.repeat),
              iconSize: 20,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: TextStyle(color: whiteColor),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              selected?.duration ?? '0.00',
              style: TextStyle(color: whiteColor),
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.devices_outlined),
          iconSize: 20,
          color: whiteColor,
        ),
        Row(
          children: [
            IconButton(onPressed: null, icon: Icon(Icons.volume_up_outlined)),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen_outlined),
          iconSize: 20,
          color: whiteColor,
        ),
      ],
    );
  }
}
