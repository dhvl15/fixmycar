import 'package:fix_my_car/constants.dart';
import 'package:fix_my_car/pages/main_page.dart';
import 'package:fix_my_car/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fix_my_car/widgets/roundedButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email, password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        title: Text('FixMyCar Login'),
        // actions: <Widget>[
        //   TextButton.icon(
        //     icon: Icon(Icons.person),
        //     label: Text('Sign In',style: TextStyle(color: Colors.blueAccent),),
        //     onPressed: () => Navigator.popAndPushNamed(context, ChatScreen.id),
        //   ),
        // ],
      ),
      backgroundColor: Colors.blueGrey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        //progressIndicator: LinearProgressIndicator(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      height: 200.0,
                      child: Image.asset('asset/images/carlogo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  validator: (v){
                    if(v.isEmpty){
                      return "enter email";
                    }else if(!v.contains("@") && !v.contains(".")){
                      return "invalid email";
                    }else{
                      return null;
                    }
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your password"),
                  validator: (v){
                    if(v.isEmpty){
                      return "enter password";
                    }else if(v.length < 6){
                      return "password length should be atleast 6 characters";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                    setState(() => showSpinner = true);
                    //dynamic result = await
                     _auth.signInWithEmailAndPassword(email, password).then((result){
                        if (result != null) {
                         Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
                       }
                       setState(() {
                         showSpinner = false;
                       });
                     }).catchError((e){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                          behavior: SnackBarBehavior.fixed,
                          backgroundColor: Colors.red.shade600,
                        ));
                     });
                    
                  }
          
                  },
                  title: "Log In",
                  colour: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
