enum MusicServiceName { iTunes, spotify }

enum MusicSearchType { album }

class MusicSearch {
  final String term;
  final MusicSearchType type;

  MusicSearch(this.term, this.type);
}
