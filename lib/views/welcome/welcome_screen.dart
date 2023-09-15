import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';
import 'package:tale_weaver/views/login/login_screen.dart';
import 'package:tale_weaver/views/sign_up/sign_up_screen.dart';
import 'package:tale_weaver/views/welcome/components/background.dart';

class WelcomeScreen extends StatelessWidget{

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    Widget welcomeTextSection = const Text(
      'Welcome to,',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );

    Widget loginButton = RoundedButton(
      text: "Log in", 
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      },
    );

    Widget signUpButton = RoundedButton(
      text: "Sign Up", 
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const SignUpScreen();
            },
          ),
        );
      },
      color: kPrimaryLightColor,
      textColor: Colors.black,
    );

    return Scaffold(
      body: Background(
        child: Container(
          padding: EdgeInsets.only(top: size.height*0.08),
          child: ListView(
            children: [
              Column(
                children: [
                  welcomeTextSection,
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  titleSection(),
                  Image.asset(
                    'assets/images/dandelion-lute.png',
                    height: size.height * 0.3,  
                  ),
                  loginButton,
                  signUpButton,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}