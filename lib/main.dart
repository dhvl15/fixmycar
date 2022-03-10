import 'package:firebase_core/firebase_core.dart';
import 'package:fix_my_car/models/user.dart';
import 'package:fix_my_car/pages/login_screen.dart';
import 'package:fix_my_car/pages/main_page.dart';
import 'package:fix_my_car/pages/registration_screen.dart';
import 'package:fix_my_car/pages/welcome_screen.dart';
import 'package:fix_my_car/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      title: 'FixMyCar',
      debugShowCheckedModeBanner: false,
      initialRoute: Wrapper.id,
      routes: {
        Wrapper.id: (context) => Wrapper(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MainPage.id: (context) => MainPage(),
      },
      //home: Wrapper(),
      ),
    );
  }
}


class Wrapper extends StatelessWidget {
  static const id = "wrapper";
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return WelcomeScreen();
    } else {
      return MainPage();
    }
    
  }
}
