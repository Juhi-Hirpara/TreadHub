import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:treadhub/screens/authentication/OtpVerificationScreen.dart';
import 'package:treadhub/screens/login.dart';
import 'package:treadhub/screens/splash_screen.dart';
import 'package:treadhub/screens/authentication/phoneauth_screen.dart';
import 'package:treadhub/screens/authentication/HomeScreen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    // Replace the 3 second delay with your initialization code:
    future: Future.delayed(Duration(seconds: 3)),
    builder: (context, AsyncSnapshot snapshot) {
      // Show splash screen while waiting for app resources to load:
      if (snapshot.connectionState == ConnectionState.waiting) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen());
      // Assuming Splash is a widget
      } else {
      // Loading is done, return the app:
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: LoginScreen(),
        routes: {
          LoginScreen.id:(context)=>LoginScreen(),
          phoneAuthScreen.id:(context)=>phoneAuthScreen(),
          OtpVerificationScreen.id: (context) => OtpVerificationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },

      );
      }
    },
    );
  }
  }


