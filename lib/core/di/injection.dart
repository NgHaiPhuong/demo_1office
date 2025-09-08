import 'package:get_it/get_it.dart';

import '../../features/domain/usecases/log_in.dart';
import '../../features/presentation/log_in/bloc/log_in_bloc.dart';
import '../../features/data/repositories/user_repository_impl.dart';
import '../../features/data/datasources/user_data_sources.dart';
//
// GetIt sl = GetIt.instance; // sl = service locator
//
// Future<void> init() async{
//   /// **Data Source**
//   sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource());
//
//   /// **Repository**
//   sl.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(sl()));
//
//   /// **Use Cases**
//   sl.registerLazySingleton<LogInUserCase>(() => LogInUserCase(sl()));
//
//   /// **Cubits**
//   sl.registerFactory<LogInCubit>(() => LogInCubit(sl()));
// }
