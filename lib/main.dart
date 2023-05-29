import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/models/current_track_model.dart';
import 'package:spotify_ui/screens/playlist_screen.dart';
import 'package:spotify_ui/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(Size(600, 800));
  }

  runApp(ChangeNotifierProvider(
    create: (context) => CurrentTrackModel(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              if(MediaQuery.of(context).size.width > 800)
              SideMenu(),
              Expanded(
                  child: PlayerScreen(
                playlist: lofihiphopPlaylist,
              )),
            ],
          )),
          CurrentTrack(),
        ],
      ),
    );
  }
}
