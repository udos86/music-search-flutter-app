import 'package:flutter/material.dart';
import 'package:music_search_flutter_app/model/album.model.dart';
import 'package:music_search_flutter_app/view/album-listview.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumDetailPage extends StatefulWidget {
  AlbumDetailPage({Key key, this.index, this.album}) : super(key: key);

  final int index;
  final Album album;

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.album.title),
        ),
        body: Center(
            child: Hero(
                tag: AlbumListView.getLeadingHeroTag(widget.index),
                child: FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    placeholder: kTransparentImage,
                    image: widget.album.artworkUrl,
                    fadeInDuration: Duration(milliseconds: 300)))));
  }
}
