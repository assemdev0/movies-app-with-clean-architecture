import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../core/error/failures.dart';
import '../entities/movie.dart';
import '../usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailModel>> getMovieDetails(
      MovieDetailsParams params);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParams params);
}
