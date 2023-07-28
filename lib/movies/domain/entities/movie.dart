import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final double voteAverage;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.genreIds,
  });

  @override
  List<Object> get props => [
        id,
        voteAverage,
        title,
        overview,
        releaseDate,
        posterPath,
        genreIds,
      ];
}
