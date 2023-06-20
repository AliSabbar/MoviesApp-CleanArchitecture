import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/movie_recommended_usecase.dart';
import 'package:movie_app/movies/domain/usecases/movie_top_rated_usecase.dart';
import 'package:movie_app/search/data/datasource/seach_remote_datasource.dart';
import 'package:movie_app/search/data/repository/search_repository.dart';
import 'package:movie_app/search/domain/repository/base_search_repository.dart';
import 'package:movie_app/search/domain/usecases/search_usecase.dart';
import 'package:movie_app/tv/data/datasource/tv_remote_datasource.dart';
import 'package:movie_app/tv/data/repository/tv_repository.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repository.dart';
import 'package:movie_app/tv/domain/usecases/popular_tv_usecase.dart';
import 'package:movie_app/tv/domain/usecases/top_rated_tv_usecase.dart';

import '../../movies/domain/usecases/movie_now_playing_usecase.dart';
import '../../movies/domain/usecases/movie_papular_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //* USE CASES

    sl.registerLazySingleton(() => MovieNowPlayingUseCase(sl()));

    sl.registerLazySingleton(() => MoviePapularUseCase(sl()));

    sl.registerLazySingleton(() => MovieTopRatedUseCase(sl()));

    sl.registerLazySingleton(
      () => MovieDetailsUseCase(baseMovieRepository: sl()),
    );

    sl.registerLazySingleton(
      () => MovieRecommendedUseCase(baseMovieRepository: sl()),
    );

    sl.registerLazySingleton(() => SearchUseCase(baseSearchRepository: sl()));

    //  TV

    sl.registerLazySingleton(() => GetPopularTvUseCase(baseTvRepository: sl()));

    sl.registerLazySingleton(
        () => GetTopRatedTvUseCase(baseTvRepository: sl()));

    //* BASE REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    sl.registerLazySingleton<BaseSearchRepository>(
        () => SearchRepository(remoteDataSource: sl()));

    //* REMOTE DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    sl.registerLazySingleton<BaseSearchRemoteDataSource>(
        () => SearchRemoteDataSource());
  }
}
