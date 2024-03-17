import 'package:bus/auth/data/datasource/auth_remote_data_source.dart';
import 'package:bus/auth/data/repository/auth_repository.dart';
import 'package:bus/auth/domain/repository/base_auth_repository.dart';
import 'package:bus/auth/domain/usecases/login_usecase.dart';
import 'package:bus/auth/domain/usecases/register_usecase.dart';
import 'package:bus/auth/presentation/controller/auth_bloc.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => AuthBloc(
      sl<LoginUsecase>(),
      sl<RegisterUseCase>(),
    ));

    sl.registerLazySingleton(() => LoginUsecase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));

    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(sl()));

    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
