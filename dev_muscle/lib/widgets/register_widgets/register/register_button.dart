import 'package:dev_muscle/components/styles.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback myOnPressed;

  RegisterButton({super.key, required this.myOnPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles.RegisterLoginButtonStyle(),
      onPressed: myOnPressed,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign Up"),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
