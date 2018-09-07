import 'dart:io';

import 'package:music_search_flutter_app/bloc/music-search.model.dart';

class MusicSearchApi {
  static String _getBaseUrl(MusicPlatform platform) {
    final platformUrlMap = {
      MusicPlatform.iTunes.index: 'itunes',
      MusicPlatform.spotify.index: 'spotify'
    };

    var platformUrlSegment = platformUrlMap[platform.index];
    var baseUrl = "http://localhost:3000/api/v1/$platformUrlSegment/search";

    if (Platform.isAndroid) {
      baseUrl = "http://10.0.2.2:3000/api/v1/$platformUrlSegment/search";
    }

    return baseUrl;
  }

  static Uri getAlbumsUrl(MusicSearch search, MusicPlatform platform) {
    var baseApi = _getBaseUrl(platform);
    var artistParam = search.term.toLowerCase();

    return Uri.parse("$baseApi/albums?artist=$artistParam");
  }
}
