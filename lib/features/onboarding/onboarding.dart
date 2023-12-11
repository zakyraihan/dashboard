import 'package:dashboard/features/user_auth/signup.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/auth/Group 27567.png'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen())),
              child: const Text('Masuk'),
            )
          ],
        ),
      ),
    );
  }
}
