import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failures.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';

import '../../../core/usecase/base_usecase.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParams params) {
    return baseMoviesRepository.getRecommendation(params);
  }
}

class RecommendationParams extends Equatable {
  final int id;

  const RecommendationParams(this.id);

  @override
  List<Object> get props => [id];
}
