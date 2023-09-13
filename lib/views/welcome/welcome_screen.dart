import 'package:flutter/material.dart';
import 'package:tale_weaver/views/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget{

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Body()
    );
  }
}