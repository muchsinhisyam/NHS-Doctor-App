import 'dart:convert';
import 'package:doctorapp/Screens/Dashboard/dashboard_screen.dart';
import 'package:doctorapp/main.dart';
import 'package:doctorapp/Screens/Components/rounded_input_field.dart';
import 'package:doctorapp/Screens/Components/rounded_password_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/Screens/Components/already_have_an_account_check.dart';
import 'package:doctorapp/Screens/Components/login_with_button.dart';
import 'package:doctorapp/Screens/Components/rounded_button.dart';
import 'package:doctorapp/Screens/Login/Components/background.dart';
import 'package:doctorapp/Screens/SignUp/signup.dart';
import 'package:doctorapp/color_constant.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

  const Login({
    Key key,
  }) : super(key: key);
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async{
    final response = await http.post("http://10.0.2.2/NHS-Flutter/login.php", body: {
      "email": email.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    // If the app can't get the User data then login failed
    if (datauser == "Success" && (email.text != '' || pass.text != '')) {
      // Give token to set login session
      await FlutterSession().set('token', email.text);
      // Show notification
      Fluttertoast.showToast(
          msg: "Login success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          fontSize: 20
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardScreen(),),);
    } else {
      Fluttertoast.showToast(
          msg: "Incorrect email or password!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          fontSize: 20
      );
    }

    return datauser;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset("assets/icons/antemr_logo2_white.svg", height: size.height*0.18,),
              // Make Notification of Login Status
              Text(
                msg,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red
                ),
              ),
              RoundedInputField(
                controller: email,
                hintText: "Your Email",
                onChanged: (value){},
              ),
              RoundedPasswordField(
                controller: pass,
                hintText: "Password",
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                color: mSubColor,
                fontSize: 16,
                press: () {
                  _login();
                },
              ),
              SizedBox(height: size.height *0.02,), // Padding between widgets
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignUpScreen();
                  },),);
                },
              ),
              SizedBox(height: size.height *0.02,), // Padding between widgets
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 3,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "  OR  ",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 3,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height *0.02,), // Padding between widgets
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginWithButton(
                    iconLocation: "assets/icons/google_icon.svg",
                    buttonColor: Colors.white,
                    buttonBorderColor: Colors.white,

                  ),
                  SizedBox(width: size.width *0.05,), // Padding between widgets
                  LoginWithButton(
                    iconLocation: "assets/icons/facebook_icon.svg",
                    buttonColor: mFacebookColor,
                    buttonBorderColor: mFacebookColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


