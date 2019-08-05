class DiscoverMedia {
  final int id;
  final String title;
  final String poster_path;
  final String backdrop_path;
  final String overview;

  DiscoverMedia({
    this.id,
    this.title,
    this.poster_path,
    this.backdrop_path,
    this.overview
  });

  factory DiscoverMedia.fromJson(Map<String, dynamic> json) => DiscoverMedia(
      id: json['id'],
      title: json['title'],
      poster_path: json['poster_path'],
      backdrop_path: json['backdrop_path'],
      overview: json['overview']
  );
}
