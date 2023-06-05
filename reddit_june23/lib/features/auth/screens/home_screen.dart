import 'package:flutter/material.dart';
import 'package:reddit_june23/features/auth/screens/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Image.asset(
        //   'assets/images/reddit-logo.png',
        //   width: 70,
        // ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Skip'),
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Dive in this world'),
            Image.asset(
              'assets/images/communityIcon.png',
              width: 500,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailSignUp()),
                  );
                },
                icon: const Icon(Icons.email),
                label: const Text('Continue to Sign Up'))
          ]),
    );
  }
}
