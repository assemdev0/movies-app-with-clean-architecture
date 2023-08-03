import 'package:equatable/equatable.dart';

import '../../../../core/utilities/enums.dart';
import '../../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState nowPlayingRequestState;
  final List<Movie> popularMovies;
  final String popularMessage;
  final RequestState popularRequestState;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;
  final RequestState topRatedRequestState;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = "",
    this.nowPlayingRequestState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = "",
    this.popularRequestState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = "",
    this.topRatedRequestState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    String? nowPlayingMessage,
    RequestState? nowPlayingRequestState,
    List<Movie>? popularMovies,
    String? popularMessage,
    RequestState? popularRequestState,
    List<Movie>? topRatedMovies,
    String? topRatedMessage,
    RequestState? topRatedRequestState,
  }) =>
      MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingRequestState:
            nowPlayingRequestState ?? this.nowPlayingRequestState,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMessage: popularMessage ?? this.popularMessage,
        popularRequestState: popularRequestState ?? this.popularRequestState,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      );

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingMessage,
        nowPlayingRequestState,
        popularMovies,
        popularMessage,
        popularRequestState,
        topRatedMovies,
        topRatedMessage,
        topRatedRequestState,
      ];
}
