import 'package:flutter/material.dart';

class RegisterWithGoogle extends StatelessWidget {
  const RegisterWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Image.asset("assets/images/loginandRegister/Google.png"),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xff3A3A3C)),
          padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
    );
  }
}
