import 'dart:io';

import 'package:music_search_flutter_app/bloc/music-search.model.dart';

class MusicSearchApi {
  static String _getBaseUrlPlatformSegment(MusicPlatform platform) {
    final segmentMap = {
      MusicPlatform.iTunes.index: 'itunes',
      MusicPlatform.spotify.index: 'spotify'
    };

    return segmentMap[platform.index];
  }

  static String _getBaseUrl(MusicPlatform platform) {
    var domain = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var platformSegment = _getBaseUrlPlatformSegment(platform);

    return "http://$domain:3000/api/v1/$platformSegment/search";
  }

  static Uri getAlbumsByArtistUrl(MusicSearch search, MusicPlatform platform) {
    var baseUrl = _getBaseUrl(platform);
    var artistParam = search.term.toLowerCase();

    return Uri.parse("$baseUrl/albums?artist=$artistParam");
  }
}
