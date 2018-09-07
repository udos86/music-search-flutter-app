import 'package:flutter/widgets.dart';
import 'package:music_search_flutter_app/bloc/music-search.bloc.dart';
import 'package:music_search_flutter_app/bloc/music-search.model.dart';

class MusicSearchProvider extends InheritedWidget {
  final Map<MusicPlatform, MusicSearchBloc> blocs = Map();

  MusicSearchProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child) {
    blocs[MusicPlatform.iTunes] = MusicSearchBloc(MusicPlatform.iTunes);
    blocs[MusicPlatform.spotify] = MusicSearchBloc(MusicPlatform.spotify);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MusicSearchBloc of(BuildContext context, MusicPlatform service) =>
      (context.inheritFromWidgetOfExactType(MusicSearchProvider) as MusicSearchProvider).blocs[service];
}
