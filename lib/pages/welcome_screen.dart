import 'package:fix_my_car/pages/login_screen.dart';
import 'package:fix_my_car/pages/registration_screen.dart';
import 'package:fix_my_car/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // for curved animation
    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    //for ColorTween
    animation = ColorTween(
      begin: Colors.white,
      end: Colors.blueGrey,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('asset/images/carlogo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      "FixMyCar",
                      colors: [
                        Colors.white,
                        Color(0xff504944),
                        Color(0xffA28E8F),
                        Colors.white
                      ],
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                    // WavyAnimatedText(
                    //   "FixMyCar",
                    //   textStyle: TextStyle(
                    //     fontSize: 45.0,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    //   speed: Duration(milliseconds: 150),
                    // )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "Log In",
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.id);
              },
              colour: Colors.lightBlueAccent,
            ),
            RoundedButton(
              title: "Register",
              onPressed: () {
                Navigator.of(context).pushNamed(RegistrationScreen.id);
              },
              colour: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
