import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
// import '../../assets/webpages/index.html';

import '../components/Rounded_Button_New.dart';
import '../components/background.dart';
import 'customer_screen.dart';
import 'login_screen.dart';

class VerifyEmailPage extends StatefulWidget {
  static const String id = 'verify_screen';
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = true;

  Timer? timer;

  Color buttonColor = Color.fromRGBO(5, 132, 54, 1);

  @override
  void initState() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (isEmailVerified) {
    } else {
      sendVerificationEmailInit();

      timer = Timer.periodic(Duration(seconds: 3), (_) async {
        checkEmailVerified();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              controller.loadUrl("assets/webpages/index.html");
            },
            javascriptChannels: Set.from([
              JavascriptChannel(
                  name: 'Captcha',
                  onMessageReceived: (JavascriptMessage message) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerScreen()));
                  })
            ]),
          )
        : Scaffold(
            body: Background(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 100),
                        Text(
                          'HELLO THERE!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 30,
                                  color: const Color.fromRGBO(5, 132, 54, 1),
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'A Verification Link Has Been Sent',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'Please Check Your Email!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            child: Text('Resend',
                                style: const TextStyle(color: Colors.white)),
                            onPressed:
                                canResendEmail ? resendVerificationEmail : null,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 80, 80, 80),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            child: Text('Cancel',
                                style: const TextStyle(color: Colors.white)),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.id);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future sendVerificationEmailInit() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } on Exception catch (e) {
      var message = 'An error occurd!';

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future resendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
        buttonColor = Colors.grey;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
        buttonColor = Color.fromRGBO(5, 132, 54, 1);
      });
    } on Exception catch (e) {
      var message = 'An error occurd!';

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }
}
