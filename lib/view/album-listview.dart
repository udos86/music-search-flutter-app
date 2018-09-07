import 'package:flutter/material.dart';
import 'package:music_search_flutter_app/bloc/music-search.bloc.dart';
import 'package:music_search_flutter_app/bloc/music-search.model.dart';
import 'package:music_search_flutter_app/bloc/music-search.provider.dart';
import 'package:music_search_flutter_app/model/album.model.dart';
import 'package:music_search_flutter_app/view/album-detail-page.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumListView extends StatelessWidget {
  static String getLeadingHeroTag(int index) {
    return "LEADING_HERO_TAG_" + index.toString();
  }

  @override
  Widget build(BuildContext context) {
    //final MusicSearchBloc iTunesSearchBloc =
    //    MusicSearchProvider.of(context, MusicPlatform.iTunes);
    final MusicSearchBloc spotifySearchBloc =
        MusicSearchProvider.of(context, MusicPlatform.spotify);

    //iTunesSearchBloc.search
    //    .add(MusicSearch("Black Rebel Motorcycle Club", MusicSearchType.album));

    spotifySearchBloc.search.add(MusicSearch("Black Rebel Motorcycle Club", MusicSearchType.album));

    return StreamBuilder<List<Album>>(
        stream: spotifySearchBloc.albums,
        builder: (context, snapshot) {
          return ListView.builder(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              itemCount: snapshot.data is List<Album> ? snapshot.data.length : 0,
              itemBuilder: (context, index) {
                return _buildListItem(context, index, snapshot.data[index]);
              });
        });
  }

  Widget _buildListItem(BuildContext context, int index, Album item) {
    return ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(item.title),
        subtitle: Text(item.year),
        onTap: () => _onListTileTaped(context, index, item),
        leading: Hero(
            tag: AlbumListView.getLeadingHeroTag(index),
            child: FadeInImage.memoryNetwork(
                width: 56.0,
                placeholder: kTransparentImage,
                image: item.artworkUrl,
                fadeInDuration: Duration(milliseconds: 300))));
  }

  void _onListTileTaped(BuildContext context, int index, Album item) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => AlbumDetailPage(index: index, album: item)));
  }
}
