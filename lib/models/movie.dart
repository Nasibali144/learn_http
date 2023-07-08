class Movie {
  int id;
  String movie;
  num rating;
  String image;
  String imdbUrl;

  Movie({
    required this.id,
    required this.movie,
    required this.rating,
    required this.image,
    required this.imdbUrl,
  });

  factory Movie.fromJson(Map<String, Object?> json) {
    return Movie(
      id: json['id'] as int,
      movie: json['movie'] as String,
      rating: json['rating'] as num,
      image: json['image'] as String,
      imdbUrl: json['imdb_url'] as String,
    );
  }

  @override
  String toString() {
    return "Movie(movie: $movie, id: $id)";
  }
}
