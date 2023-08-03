import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final int runtime;
  final double voteAverage;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final List<Genres> genres;

  const MovieDetail({
    required this.id,
    required this.runtime,
    required this.voteAverage,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
  });

  @override
  List<Object> get props => [
        id,
        runtime,
        voteAverage,
        title,
        overview,
        posterPath,
        releaseDate,
        genres,
      ];
}
