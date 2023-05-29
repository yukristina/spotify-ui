import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/models/current_track_model.dart';
import 'package:spotify_ui/widgets/colors.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  TracksList({super.key, required this.tracks});

  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 50,
      headingTextStyle: TextStyle(fontSize: 12),
      showCheckboxColumn: false,
      columns: [
        DataColumn(
            label: Text(
          'TITLE',
          style: TextStyle(color: whiteColor),
        )),
        DataColumn(
            label: Text(
          'ARTIST',
          style: TextStyle(color: whiteColor),
        )),
        DataColumn(
            label: Text(
          'ALBUM',
          style: TextStyle(color: whiteColor),
        )),
        DataColumn(
            label: Icon(
          Icons.access_time,
          color: whiteColor,
        )),
      ],
      rows: tracks.map((e) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textstyle = TextStyle(color: selected ? greenColor : whiteColor);
        return DataRow(
          cells: [
            DataCell(Text(
              e.title,
              style: textstyle,
            )),
            DataCell(Text(
              e.artist,
              style: textstyle,
            )),
            DataCell(Text(
              e.album,
              style: textstyle,
            )),
            DataCell(Text(
              e.duration,
              style: textstyle,
            )),
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}
