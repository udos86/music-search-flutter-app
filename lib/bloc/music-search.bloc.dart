import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:music_search_flutter_app/bloc/music-search-api.dart';
import 'package:music_search_flutter_app/bloc/music-search.model.dart';
import 'package:music_search_flutter_app/model/album.model.dart';
import 'package:rxdart/subjects.dart';

class MusicSearchBloc {
  final _albumsController = BehaviorSubject<List<Album>>(seedValue: []);
  final _searchController = StreamController<MusicSearch>();

  final MusicPlatform _platform;

  Sink<MusicSearch> get search => _searchController.sink; //@Input

  Stream<List<Album>> get albums => _albumsController.stream; //@Output

  List<StreamSubscription<dynamic>> _subscriptions;

  MusicSearchBloc(this._platform) {
    _subscriptions = <StreamSubscription<dynamic>>[
      _searchController.stream.listen(_get)
    ];
  }

  void dispose() {
    _albumsController.close();
    _searchController.close();
    _subscriptions.forEach((subscription) => subscription.cancel());
  }

  void _get(MusicSearch search) async {
    var httpClient = HttpClient();
    var url = MusicSearchApi.getAlbumsUrl(search, this._platform);

    var request = await httpClient.getUrl(url);
    var response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      var jsonString = await response.transform(utf8.decoder).join();
      var data = json.decode(jsonString);
      var albums = List<Album>();

      for (var albumObject in data) {
        albums.add(Album(
            title: albumObject["title"],
            artworkUrl: albumObject["artworkUrl"]));
      }

      _albumsController.add(albums);
    }
  }
}
