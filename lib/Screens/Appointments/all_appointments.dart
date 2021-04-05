import 'package:doctorapp/Screens/Appointments/appointment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return AppointmentsDetail();
                            },
                          ),
                        );
                      },
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text("All Appointments Data", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: Column(
              children:<Widget>[
                SizedBox(
                  height: size.height *0.01
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: dataBody()
                    )
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
