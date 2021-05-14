import 'package:doctorapp/Screens/Dashboard/Components/body.dart';
import 'package:doctorapp/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Body(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: mPrimaryColor, size: 30,),
            title: new Text(
              'Home',
              style: TextStyle(
                color: mPrimaryColor,
                fontFamily: 'Poppins',
                fontSize: 14
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: mPrimaryColor, size: 30,),
            title: new Text(
              'Profile',
              style: TextStyle(
                  color: mPrimaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 14
              ),
            ),
          ),
        ],
      ),
    );
  }
}
