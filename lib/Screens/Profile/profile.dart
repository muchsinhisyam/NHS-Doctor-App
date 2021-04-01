import 'package:doctorapp/Screens/Login/login_screen.dart';
import 'package:doctorapp/Screens/Profile/Components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../color_constant.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Body(),
      appBar: AppBar(
        title: SvgPicture.asset("assets/icons/antemr_logo2_white.svg", width: size.width*0.4,),
        backgroundColor: mPrimaryColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.logout, size: size.width*0.08, color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
