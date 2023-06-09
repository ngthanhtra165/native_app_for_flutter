import 'package:flutter/material.dart';
import 'package:myapp/components/background.dart';
import 'package:myapp/constants.dart';
import 'components/login_sreen_top_image.dart';
import 'components/login_form.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        
        inputDecorationTheme:InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          border : OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding , horizontal: defaultPadding,)
        )

      ),
      home:  const Scaffold(
        body : Background(
        bottomImage: 'assets/images/login_bottom.png',
        child: Column(
          children: [
            LoginScreenTopImage(),
            SizedBox(
              height: defaultPadding * 2,
            ),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: LoginForm(),
                ),
                Spacer(),
              ],
            )
          ],
        ),
          ),
      )
    ); 
   
  }
}

