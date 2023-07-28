import '/core/error/exceptions.dart';
import '/core/network/error_message_model.dart';
import '/core/utilities/dio_logger.dart';

import '../../../core/network/api_constance.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await DioLogger.getDio().get(
      ApiConstance.nowPlayingEndPoint,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await DioLogger.getDio().get(
      ApiConstance.popularEndPoint,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await DioLogger.getDio().get(
      ApiConstance.topRatedEndPoint,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
