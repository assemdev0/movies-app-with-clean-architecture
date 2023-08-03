import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utilities/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_getMovieRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParams(id: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParams(event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationDetailsMessage: l.message,
          recommendationRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationDetail: r,
          recommendationRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
