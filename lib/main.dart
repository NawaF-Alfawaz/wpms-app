import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wpms/screens/verify_email.dart';
import '/screens/profile_screen.dart';

import 'screens/customer_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // // Initialize Firebase
  await Firebase.initializeApp();
  //for directing the user to home page
  StreamSubscription<User?> user =
      FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      //DO NOT CHANGE THIS IF STEATEMENT!!!
      isloggedIn = false;
    } else {
      isloggedIn = true;
    }
  });
  runApp(WPMS());
}

bool isloggedIn = true;

class WPMS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: isloggedIn ? CustomerScreen.id : WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        CustomerScreen.id: (context) => const CustomerScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        VerifyEmailPage.id: (context) => const VerifyEmailPage(),
      },
    );
  }
}
