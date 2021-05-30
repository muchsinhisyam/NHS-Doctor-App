import 'package:doctorapp/Screens/Components/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../color_constant.dart';

class PatientDetails extends StatefulWidget {
  List list;
  int index;
  PatientDetails({this.index, this.list});

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      appBar: AppBar(
        title: Text("Patient Data", style: TextStyle(color: Colors.white),),
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
                  TextLabel("PUBP ID"),
                  TextData(widget.list[widget.index]['pubpid']),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Patient ID"),
                  TextData(widget.list[widget.index]['pid']),
                  SizedBox(height: size.height *0.04),
                  TextLabel("DOB"),
                  TextData(widget.list[widget.index]['DOB']),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Sex"),
                  TextData(widget.list[widget.index]['sex']),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Country Code"),
                  TextData(widget.list[widget.index]['country_code']),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Address"),
                  TextData(widget.list[widget.index]['street'] + ", " + widget.list[widget.index]['city'] +  ", " + widget.list[widget.index]['state'] + ", " + widget.list[widget.index]['postal_code']),
                  SizedBox(height: size.height *0.04),
                  TextLabel("Phone"),
                  TextData(widget.list[widget.index]['phone_cell']),
                  SizedBox(height: size.height *0.04),

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
