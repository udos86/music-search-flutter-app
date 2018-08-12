import 'package:flutter/widgets.dart';
import 'package:music_search_flutter_app/bloc/music-search-endpoint-builder.dart';
import 'package:music_search_flutter_app/bloc/music-search.bloc.dart';
import 'package:music_search_flutter_app/bloc/music-search.model.dart';

class MusicSearchProvider extends InheritedWidget {
  final Map<MusicServiceName, MusicSearchBloc> blocs = Map();

  MusicSearchProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child) {
    blocs[MusicServiceName.iTunes] = MusicSearchBloc(ITunesEndpointBuilder());
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MusicSearchBloc of(BuildContext context, MusicServiceName service) =>
      (context.inheritFromWidgetOfExactType(MusicSearchProvider) as MusicSearchProvider).blocs[service];
}
