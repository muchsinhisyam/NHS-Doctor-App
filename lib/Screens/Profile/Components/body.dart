import 'package:flutter/material.dart';
import 'package:doctorapp/color_constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
      padding: EdgeInsets.only(left: size.width * 0.03, top: size.height * 0.03, right: size.width * 0.03),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://media-exp1.licdn.com/dms/image/C5603AQEqvtMuIlZ0Xw/profile-displayphoto-shrink_200_200/0/1588403916605?e=1619049600&v=beta&t=7nwMnxWOzA-P7f2NBNRUbs_hmCwsGCr4tv6T2bKhx-0",
                            ))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: mPrimaryColor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            EditTextField("Full Name", "Muchsin Hisyam"),
            EditTextField("E-mail", "muchsin@gmail.com"),
            EditTextField("Location", "Jakarta, Indonesia"),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  color: mPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2.2,
                        color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
    );
  }

  Widget EditTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
      ),
    );
  }
}
