import 'package:doctorapp/Screens/Appointments/incoming_appointments.dart';
import 'package:doctorapp/Screens/Dashboard/Components/dashboard_button.dart';
import 'package:doctorapp/Screens/Login/login_screen.dart';
import 'package:doctorapp/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return SafeArea(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              title: SvgPicture.asset("assets/icons/antemr_logo2_white.svg", width: size.width*0.4,),
              backgroundColor: mPrimaryColor,
              elevation: 1,
              centerTitle: true,
              leading: Icon(Icons.menu, color: Colors.white, size: size.width*0.1,),
              actions: <Widget>[
                Icon(Icons.logout, size: size.width*0.1, color: Colors.white,),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Welcome, Doctor Muchsin!",
                style: TextStyle(
                  color: mPrimaryColor,
                  fontSize: 24,
                  fontFamily: "PoppinsBold",
                  letterSpacing: 1
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: <Widget>[
                    DashboardButton(
                      iconSelected: Icons.pending_actions,
                      iconColor: Colors.white,
                      buttonText: "Incoming Appointments",
                    ),
                    DashboardButton(
                      iconSelected: Icons.list,
                      iconColor: Colors.white,
                      buttonText: "All Appointments",
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return AllAppointmentScreen();
                            },
                          ),
                        );
                      },
                    ),
                    DashboardButton(
                      iconSelected: Icons.done_all,
                      iconColor: Colors.white,
                      buttonText: "Appointment History",
                    ),
                    DashboardButton(
                      iconSelected: Icons.cancel,
                      iconColor: Colors.white,
                      buttonText: "Canceled Appointments",
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}