import 'package:flutter/widgets.dart';
import 'package:music_search_flutter_app/bloc/music-search.bloc.dart';

enum musicSearchBlocKey { iTunes }

class MusicSearchProvider extends InheritedWidget {
  final Map<musicSearchBlocKey, MusicSearchBloc> blocs = Map();

  MusicSearchProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child) {
    blocs[musicSearchBlocKey.iTunes] = ITunesSearchBloc();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MusicSearchBloc of(BuildContext context, musicSearchBlocKey key) =>
      (context.inheritFromWidgetOfExactType(MusicSearchProvider) as MusicSearchProvider).blocs[key];
}
