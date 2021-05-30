import 'dart:convert';

import 'package:doctorapp/Screens/Appointments/appointment_details.dart';
import 'package:doctorapp/Screens/Patients/patient_details.dart';
import 'package:flutter/material.dart';
import '../../color_constant.dart';

import 'package:http/http.dart' as http;
import 'dart:async';


class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  Future<List> getData() async{
    // Input the API URL to get the data
    final response = await http.get("http://10.0.2.2/NHS-Flutter/getDataPatients.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text("All Patients Data", style: TextStyle(color: Colors.white),),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data,)
              : new Center(
            child: new CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null
          ? 0
          : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context)=> new PatientDetails(list: list, index: i)
              ),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text("${list[i]['fname']}" + " ${list[i]['lname']}"),
                leading: new Icon(Icons.person),
                subtitle: new Text("Username: ${list[i]['username']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
