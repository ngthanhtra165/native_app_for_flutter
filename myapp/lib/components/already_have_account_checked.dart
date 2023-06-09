import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class AlreadyHaveAccountChecked extends StatelessWidget {
  const AlreadyHaveAccountChecked(
      {super.key, this.isLogin = true, required this.press});

  final bool isLogin;
  final Function()? press;
  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? "Don’t have an Account ?" : "Already have an Account ?",
          style: const TextStyle(color: kPrimaryColor),
        ),
        TextButton(
          onPressed: press,
          child: Text(
            isLogin ? "Sign up" : "Login",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
        )
      ],
    );
  }
}
