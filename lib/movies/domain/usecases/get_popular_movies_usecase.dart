import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/movie.dart';
import '/movies/domain/repositories/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
