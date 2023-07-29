import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utilities/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_usecase.dart';
import '/movies/presentation/controller/movies_event.dart';
import '/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase();

    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingMessage: l.message,
              nowPlayingRequestState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              nowPlayingRequestState: RequestState.loaded,
              nowPlayingMovies: r,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase();

    result.fold(
        (l) => emit(state.copyWith(
              popularMessage: l.message,
              popularRequestState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              popularRequestState: RequestState.loaded,
              popularMovies: r,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase();

    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.message,
              topRatedRequestState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              topRatedRequestState: RequestState.loaded,
              topRatedMovies: r,
            )));
  }
}
