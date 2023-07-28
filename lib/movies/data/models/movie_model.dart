import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.voteAverage,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.posterPath,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        voteAverage: json['vote_average'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      );
}
