import 'package:fix_my_car/models/user.dart';
import 'package:fix_my_car/services/auth.dart';
import 'package:fix_my_car/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fix_my_car/widgets/roundedButton.dart';
import 'package:fix_my_car/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddCar extends StatefulWidget {
  static const id = "add_car";
  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final AuthService _auth = AuthService();
  MyUser currentUser;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String error = '';
  String number;
  String brand;
  String model;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    currentUser = _auth.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar : AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        title: Text('Add new car'),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical:50),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: "logo",
                      child: 
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('asset/images/carlogo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  
                  TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      brand = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: "Enter brand name"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'enter valid brand name';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      //Do something with the user input.
                      model = value;
                    },
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: "Enter model name"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'enter valid model name';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    textAlign: TextAlign.center,
                    //obscureText: true,
                    onChanged: (value) {
                      //Do something with the user input.
                      number = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: "Enter registration number"),
                    validator: (value){
                      if(value.isEmpty){
                        return "enter valid registration number";
                      }else if(value.length < 10){
                        return 'minimum 10 characters required';
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
                      DatabaseService(uid: currentUser.uid).updatUserCarData(brand: brand,modelName: model,number: number).whenComplete(() {
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.pop(context);
                      });
                    }
                    },
                    title: "Add",
                    colour: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
