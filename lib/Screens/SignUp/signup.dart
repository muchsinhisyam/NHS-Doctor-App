import 'dart:convert';

import 'package:doctorapp/Screens/Components/already_have_an_account_check.dart';
import 'package:doctorapp/Screens/Components/rounded_button.dart';
import 'package:doctorapp/Screens/Components/rounded_input_field.dart';
import 'package:doctorapp/Screens/Components/rounded_password_field.dart';
import 'package:doctorapp/Screens/Login/login.dart';
import 'package:doctorapp/Screens/SignUp/Components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../color_constant.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future<List> _register() async {
    var response = await http.post("http://10.0.2.2/NHS-Flutter/register.php", body: {
      "email": email.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);
    if (datauser == "Error") {
      Fluttertoast.showToast(
          msg: "User already exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
    } else {
      Fluttertoast.showToast(
          msg: "Register success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
    }
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
              SizedBox(height: size.height *0.02,), // Padding between widgets
              RoundedInputField(
                hintText: "First Name",
                onChanged: (value){},
              ),
              RoundedInputField(
                hintText: "Last Name",
                onChanged: (value){},
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value){},
                controller: email,
              ),
              RoundedPasswordField(
                hintText: "Password",
                onChanged: (value) {},
                controller: pass,
              ),
              RoundedPasswordField(
                hintText: "Confirm Password",
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGN UP",
                color: mSubColor,
                fontSize: 16,
                press: () {
                  _register();
                },
              ),
              SizedBox(height: size.height *0.02,), // Padding between widgets
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login();
                  },),);
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}

