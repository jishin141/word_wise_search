import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_wise_search/features/homepage/presentation/home.dart';
import 'package:word_wise_search/features/splash_screen/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateTo() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
  }

  @override
  void initState() {
    navigateTo();
    context.read<SplashBloc>().add(GoToHomeScreenEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashCompletedState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.yellow.shade100,
                  Colors.yellow.shade200,
                  Colors.yellow.shade300,
                  Colors.yellow.shade400,
                  Colors.yellow.shade300,
                  Colors.yellow.shade200,
                  Colors.yellow.shade100,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/image/pngwing.com.png',
                  height: height * 0.4,
                ),
                // const SizedBox(height: 20),
                Text(
                  'WordWise',
                  style: GoogleFonts.protestRiot(fontSize: height * 0.1),
                )
                    .animate()
                    .shimmer(color: Colors.blue, duration: Duration(seconds: 5))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
