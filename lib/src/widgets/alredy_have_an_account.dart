import 'package:flutter/material.dart';

class AlredyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlredyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an account ? " : "Already have an account ? ",
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Create an account" : " Log in",
            style: const TextStyle(
              color: Color(0xff7dce13),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
