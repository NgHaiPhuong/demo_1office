import 'package:demo_1office/features/presentation/forgot_pass/bloc/forgot_pass_bloc.dart';
import 'package:demo_1office/features/presentation/log_in/bloc/log_in_bloc.dart';
import 'package:demo_1office/features/presentation/log_in/screen/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LogInCubit()),
        BlocProvider(create: (_) => ForgotPassCubit()),
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
