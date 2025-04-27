// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/button_list.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:treadhub/screens/authentication/phoneauth_screen.dart';
//
// class Authui extends StatelessWidget {
//   const Authui({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,  // Light blue background color
//       padding: EdgeInsets.all(16.0),  // Optional padding for spacing
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, phoneAuthScreen.id);
//               },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.black, backgroundColor: Colors.white, // Button text/icon color
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.phone_android_outlined, color: Colors.black),
//                   SizedBox(width: 8),
//                   Text(
//                     'Continue with Phone',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             SignInButton(
//               Buttons.Google,
//               text: 'Continue with Google',
//               onPressed: () {},
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'OR',
//                 style: TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Handle login with email tap
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Login With Email',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:treadhub/screens/authentication/phoneauth_screen.dart';

class Authui extends StatelessWidget {
  const Authui({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Use transparent background for flexibility
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Added padding for spacing
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, phoneAuthScreen.id);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal.shade900, // Button background color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone_android_outlined, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Continue with Phone',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.Google,
              text: 'Continue with Google',
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'OR',
              style: TextStyle(
                color: Colors.teal.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle login with email tap
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Login With Email',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
