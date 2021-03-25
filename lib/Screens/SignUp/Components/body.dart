import 'package:doctorapp/Screens/Components/already_have_an_account_check.dart';
import 'package:doctorapp/Screens/Components/rounded_button.dart';
import 'package:doctorapp/Screens/Components/rounded_input_field.dart';
import 'package:doctorapp/Screens/Components/rounded_password_field.dart';
import 'package:doctorapp/Screens/Login/login_screen.dart';
import 'package:doctorapp/Screens/SignUp/Components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../color_constant.dart';

class Body extends StatelessWidget {
//  const Body({
//    Key key
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              color: mSubColor,
              fontSize: 16,
              press: () {},
            ),
            SizedBox(height: size.height *0.02,), // Padding between widgets
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginScreen();
                },),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
