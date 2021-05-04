import 'package:doctorapp/Screens/Components/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../color_constant.dart';

class AppointmentsDetail extends StatefulWidget {
  List list;
  int index;
  AppointmentsDetail({this.index, this.list});

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<AppointmentsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      appBar: AppBar(
        title: Text("Appointment Detail", style: TextStyle(color: Colors.white),),
        backgroundColor: mPrimaryColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: size.height *0.02),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextLabel("Patient Name"),
                          TextData(widget.list[widget.index]['fname'] + " " + widget.list[widget.index]['lname']),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Description"),
                  TextData("I have a stomache"),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Appointment Status"),
                  TextData("On Progress"),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Appointment Date & Time"),
                  TextData("12-02-2000 | @12.00 P.M."),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Address"),
                  TextData("Jalan Senayan No. 18, 12075, Jakarta, Indonesia."),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Phone"),
                  TextData("+6281-2345-6789"),
                  SizedBox(height: size.height *0.04),
                  RoundedButton(
                    text: "Cancel Appointment",
                    color: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16,
                    press: (){},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget TextLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Widget TextData(String text) {
    return Text(
        text,
        style: TextStyle(
          height: 1.6,
          fontSize: 15
        ),
      );
  }
}