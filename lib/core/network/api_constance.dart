class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "5efb56a35aab9a710a1f08812daa0a81";

  static const String nowPlayingEndPoint = "/movie/now_playing";

  static const String popularEndPoint = "/movie/popular";

  static const String topRatedEndPoint = "/movie/top_rated";

  static String movieDetails(int id) => '/movie/$id';

  static String recommendation(int id) => '/movie/$id/recommendations';

  static String imageUrl(String path) => 'https://image.tmdb.org/t/p/w500$path';
}
