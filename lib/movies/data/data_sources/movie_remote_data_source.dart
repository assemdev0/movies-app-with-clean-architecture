import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utilities/app_constance.dart';
import 'package:movies_app/core/utilities/dio_logger.dart';

import '../models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await DioLogger.getDio().get(AppConstance.nowPlayingEndPoint);

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
