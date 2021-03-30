import 'package:flutter/material.dart';
import '../../user.dart';
import '../../color_constant.dart';

class AllAppointmentScreen extends StatefulWidget {
  @override
  _AllAppointmentScreenState createState() => _AllAppointmentScreenState();
}

class _AllAppointmentScreenState extends State<AllAppointmentScreen> {
  List<User> users;

  @override
  void initState(){
    users = User.getUsers();
    super.initState();
  }

  DataTable dataBody(){
    return DataTable(
      columns: [
        DataColumn(
            label: Text("FIRST NAME"),
            numeric: false,
            tooltip: "First name of the patient."
        ),
        DataColumn(
            label: Text("LAST NAME"),
            numeric: false,
            tooltip: "Last name of the patient."
        ),
        DataColumn(
            label: Text("DATE"),
            numeric: false,
            tooltip: "Last name of the patient."
        ),
        DataColumn(
            label: Text("STATUS"),
            numeric: false,
            tooltip: "Last name of the patient."
        ),
      ],
      rows: users.map(
            (user) => DataRow(
                cells: [
                  DataCell(
                    Text(user.firstname),
                  ),
                  DataCell(
                    Text(user.lastname),
                  ),
                  DataCell(
                    Text(user.date),
                  ),
                  DataCell(
                    Text(user.status),
                  ),
                ]
            ),
          ).
          toList(),
    );
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
        title: Text("All Appointments", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: dataBody()
              )
            ),
          )
        ],
      ),
    );
  }
}
