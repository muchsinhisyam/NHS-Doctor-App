import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithButton extends StatelessWidget {
  final Color buttonColor, buttonBorderColor;
  final String iconLocation;
  const LoginWithButton({
    Key key, this.buttonColor, this.iconLocation, this.buttonBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: buttonBorderColor
          ),
          shape: BoxShape.circle,
          color: buttonColor
      ),
      child: SvgPicture.asset(
        iconLocation,
        width: 30,
        height: 30,
      ),

    );
  }
}