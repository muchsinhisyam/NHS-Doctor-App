import 'package:doctorapp/Screens/Dashboard/dashboard_screen.dart';
import 'package:doctorapp/Screens/Profile/profile.dart';
import 'package:doctorapp/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'Screens/Welcome/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  dynamic token = FlutterSession().get('token');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor App - NHS',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        scaffoldBackgroundColor: mPrimaryColor,
      ),
      // Set default page
      home: token != '' ? WelcomeScreen() : DashboardScreen(),
      routes: <String, WidgetBuilder>{
        '/DashboardPage': (BuildContext context)=> new DashboardScreen(),
        '/ProfilePage': (BuildContext context)=> new ProfileScreen(),
      },
    );
  }
}
