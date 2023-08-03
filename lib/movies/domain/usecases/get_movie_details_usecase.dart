import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failures.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParams params) {
    return baseMoviesRepository.getMovieDetails(params);
  }
}

class MovieDetailsParams extends Equatable {
  final int id;

  const MovieDetailsParams({required this.id});

  @override
  List<Object> get props => [id];
}
