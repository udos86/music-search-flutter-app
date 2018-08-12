import 'package:flutter/material.dart';
import 'package:music_search_flutter_app/bloc/music-search.provider.dart';
import 'package:music_search_flutter_app/view/album-listview.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MusicSearchProvider(
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: AlbumListView()));
  }
}
