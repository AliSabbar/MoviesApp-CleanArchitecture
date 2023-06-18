class ApiConstance {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const apiKey = "314484bf788a167ebf99b733f6058942";
  static const getPlayingNowMovies =
      "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const getPopularMovies = "${baseUrl}movie/popular?api_key=$apiKey";
  static const getTopRatedMovies = "${baseUrl}movie/top_rated?api_key=$apiKey";
  static const getTopRatedTv = "${baseUrl}tv/top_rated?api_key=$apiKey";
  static const getPopularTv = "${baseUrl}tv/popular?api_key=$apiKey";
  static const getDiscoverTv = "${baseUrl}discover/tv?api_key=$apiKey";

  static const baseImage = "https://image.tmdb.org/t/p/w500";

  static String getImage({required String image}) => baseImage + image;

  static String getMovieDetails(int id) => "$baseUrl/movie/$id?api_key=$apiKey";

  static String getRecommendedMovies(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";

  static String getTvDetails(int id) => "$baseUrl/tv/$id?api_key=$apiKey";

  static String getRecommendedTv(int id) =>
      "$baseUrl/tv/$id/recommendations?api_key=$apiKey";
}
