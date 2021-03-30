import 'package:flutter/material.dart';

import '../../../color_constant.dart';

class DashboardButton extends StatelessWidget {
  final IconData iconSelected;
  final Function press;
  final Color iconColor;
  final String buttonText;
  const DashboardButton({
    Key key, this.iconSelected, this.iconColor, this.buttonText, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 180,
        height: 180,
        child: Card(
          color: mPrimaryColor,
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: <Widget>[
                Icon(iconSelected, color: iconColor, size: 60,),
                SizedBox(height: size.height*0.02,),
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PoppinsBold',
                    color: Colors.white,
                    fontSize: 18.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}