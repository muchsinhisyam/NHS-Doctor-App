import 'package:doctorapp/Screens/Components/rounded_button.dart';
import 'package:doctorapp/Screens/Login/login.dart';
import 'package:doctorapp/Screens/SignUp/signup.dart';
import 'package:doctorapp/Screens/Welcome/Components/background.dart';
import 'package:doctorapp/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/antemr_logo_white.svg",
            height: size.height*0.5,
          ),
          Text(
            "Welcome to AntEMR!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: "PoppinsBold"
            ),
          ),
          Text(
            "Please choose Login or Register to continue.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          SizedBox(height: size.height *0.02,), // Padding between widgets
          RoundedButton(
            text: "LOGIN",
            color: Colors.white,
            textColor: mPrimaryColor,
            fontSize: 16,
            press: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return Login();
                    },
                ),
              );
            },
          ),
          RoundedButton(
            text: "REGISTER",
            color: mSubColor,
            fontSize: 16,
            press: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return SignUpScreen();
                      },
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}