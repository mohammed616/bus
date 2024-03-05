// import 'package:get_it/get_it.dart';
//
//
// final sl = GetIt.instance;
//
// class ServiceLocator {
//   void init() {
//     sl.registerFactory(() => MoviesBloc(
//           sl(),
//           sl(),
//           sl(),
//         ));
//     sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
//
//     sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
//     sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
//     sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
//     sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
//     sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
//
//     sl.registerLazySingleton<BaseMoviesRepository>(
//         () => MoviesRepository(sl()));
//
//     sl.registerLazySingleton<BaseMovieRemoteDataSource>(
//         () => MovieRemoteDataSource());
//   }
// }
