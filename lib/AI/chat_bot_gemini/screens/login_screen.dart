import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../providers/providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'My chat bot!',
            style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: double.infinity,
            height: 100,
          ),
          SizedBox(
            height: 60,
            width: w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SignInButton(
                  Buttons.google,
                  text: "Sign in with Google",
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () async {
                    await ref.read(authProvider).signInWithGoogle();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
