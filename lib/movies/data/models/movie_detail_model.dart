import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.runtime,
    required super.voteAverage,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.posterPath,
    required super.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        id: json["id"],
        runtime: json["runtime"],
        voteAverage: json['vote_average'].toDouble(),
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        genres:
            List<Genres>.from(json['genres'].map((e) => Genres.fromJson(e))),
      );
}
