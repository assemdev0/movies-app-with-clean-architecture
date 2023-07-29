import 'package:dartz/dartz.dart';

import '../../movies/domain/entities/movie.dart';
import '../error/failures.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, List<Movie>>> call();
}
