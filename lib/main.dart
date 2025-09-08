import 'package:demo_1office/features/presentation/confirm/bloc/confirm_bloc.dart';
import 'package:demo_1office/features/presentation/forgot_pass/bloc/forgot_pass_bloc.dart';
import 'package:demo_1office/features/presentation/log_in/bloc/log_in_bloc.dart';
import 'package:demo_1office/features/presentation/log_in/page/log_in_page.dart';
import 'package:demo_1office/features/presentation/verification/bloc/verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/data/datasources/user_data_sources.dart';
import 'features/data/repositories/user_repository_impl.dart';
import 'features/domain/usecases/log_in.dart';
import 'features/presentation/log_in/page/log_in_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white),
  );

  // await init();

  final userRemoteDataSource = UserRemoteDataSource();
  final userRepository = UserRepositoryImpl(userRemoteDataSource);

  final logInUserCase = LogInUserCase(userRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LogInCubit(logInUserCase)),
        BlocProvider(create: (_) => ForgotPassCubit()),
        BlocProvider(create: (_) => ConfirmCubit()),
        BlocProvider(create: (_) => VerificationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const LogInPage(),
    );
  }
}
