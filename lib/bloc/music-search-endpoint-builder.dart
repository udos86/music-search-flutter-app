import 'dart:io';

import 'package:music_search_flutter_app/bloc/music-search.model.dart';

abstract class MusicSearchEndpointBuilder {
  Uri buildAlbumsEndpoint(MusicSearch search);
}

class ITunesEndpointBuilder extends MusicSearchEndpointBuilder {
  String getBaseApi() {
    var baseApi = "http://localhost:3000/api/v1/itunes/search";

    if (Platform.isAndroid) {
      baseApi = "http://10.0.2.2:3000/api/v1/itunes/search";
    }

    return baseApi;
  }

  Uri buildAlbumsEndpoint(MusicSearch search) {
    var baseApi = getBaseApi();
    var artistParam = search.term.toLowerCase();

    return Uri.parse("$baseApi/albums?artist=$artistParam");
  }
}

class SpotifyEndpointBuilder extends MusicSearchEndpointBuilder {
  String getBaseApi() {
    var baseApi = "http://localhost:3000/api/v1/spotify/search";

    if (Platform.isAndroid) {
      baseApi = "http://10.0.2.2:3000/api/v1/spotify/search";
    }

    return baseApi;
  }

  Uri buildAlbumsEndpoint(MusicSearch search) {
    var baseApi = getBaseApi();
    var artistParam = search.term.toLowerCase();

    return Uri.parse("$baseApi/albums?artist=$artistParam");
  }
}
