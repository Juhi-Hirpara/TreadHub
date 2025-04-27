// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const colorizeColors = [
//       Colors.white,
//       Colors.grey,
//
//     ];
//
//     const colorizeTextStyle = TextStyle(
//       fontSize: 30.0,
//       fontFamily: 'Horizon',
//     );
//     return  Scaffold(
//
//       backgroundColor: Colors.cyan,
//       body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children:[
//               Image.asset('assets/images/icon.png'),
//               SizedBox(
//           width: 250.0,
//           child: AnimatedTextKit(
//             animatedTexts: [
//               ColorizeAnimatedText(
//                 'TreadHub',
//                 textStyle: colorizeTextStyle,
//                 colors: colorizeColors,
//                 textAlign: TextAlign.center,
//               ),
//
//             ],
//             isRepeatingAnimation: true,
//             onTap: () {
//               print("Tap Event");
//             },
//           ),
//         ),
//         SizedBox(height: 10,),
//               ],
//     ),
//     ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.black,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 36.0,
      fontFamily: 'Horizon',
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.png',
                height: 200.0,
                width: 200.0,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 250.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'TradeHub',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
