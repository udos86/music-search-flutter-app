import 'package:music_search_flutter_app/bloc/music-search.model.dart';

abstract class MusicSearchEndpointBuilder {
  Uri buildAlbumsEndpoint(MusicSearch search);
}

class ITunesEndpointBuilder extends MusicSearchEndpointBuilder {
  static final baseAPI = "http://10.0.2.2:3000/api/v1/itunes/search";

  Uri buildAlbumsEndpoint(MusicSearch search) {
    var artistParam = search.term.toLowerCase().replaceAll(" ", "+");

    return Uri.parse("$baseAPI/albums?artist=$artistParam");
  }
}
