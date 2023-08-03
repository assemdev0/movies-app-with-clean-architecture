part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieRequestState;
  final String movieDetailsMessage;

  final List<Recommendation> recommendationDetail;
  final RequestState recommendationRequestState;
  final String recommendationDetailsMessage;

  const MoviesDetailsState({
    this.movieDetail,
    this.movieRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationDetail = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationDetailsMessage = '',
  });

  MoviesDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieRequestState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendationDetail,
    RequestState? recommendationRequestState,
    String? recommendationDetailsMessage,
  }) =>
      MoviesDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        movieRequestState: movieRequestState ?? this.movieRequestState,
        recommendationDetail: recommendationDetail ?? this.recommendationDetail,
        recommendationDetailsMessage:
            recommendationDetailsMessage ?? this.recommendationDetailsMessage,
        recommendationRequestState:
            recommendationRequestState ?? this.recommendationRequestState,
      );

  @override
  List<Object?> get props => [
        movieDetail,
        movieRequestState,
        movieDetailsMessage,
        recommendationDetail,
        recommendationRequestState,
        recommendationDetailsMessage,
      ];
}
