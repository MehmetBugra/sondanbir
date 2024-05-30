import 'package:dev_muscle/components/styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyles.RegisterLoginButtonStyle(),
        onPressed: onPressed,
        child: const Text("Sign In"));
  }
}
