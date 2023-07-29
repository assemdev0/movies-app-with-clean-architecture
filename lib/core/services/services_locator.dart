import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repositories/movies_repository.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
