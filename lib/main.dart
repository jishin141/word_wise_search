import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_wise_search/features/counter/bloc/counter_bloc.dart';
import 'package:word_wise_search/features/counter/presentation/counter_page.dart';
import 'package:word_wise_search/features/homepage/bloc/home_bloc.dart';
import 'package:word_wise_search/features/homepage/presentation/home.dart';
import 'package:word_wise_search/features/splash_screen/bloc/splash_bloc.dart';
import 'package:word_wise_search/features/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
