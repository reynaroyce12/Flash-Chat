import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'rounded_buttons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    timeDilation = 2.0;
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                   animatedTexts: [TypewriterAnimatedText('Flash Chat',
                       textStyle: const TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900), speed: const Duration(milliseconds: 100)),],
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),

            RoundedButton(buttonColor: Colors.lightBlueAccent, handleClick: () => Navigator.pushNamed(context, '/login'), buttonTitle: 'Log In',),

            RoundedButton(buttonColor: Colors.blueAccent, handleClick: () => Navigator.pushNamed(context, '/register'), buttonTitle: 'Register',),
          ],
        ),
      ),
    );
  }
}

