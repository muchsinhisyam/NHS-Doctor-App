import 'package:doctorapp/Screens/Components/text_field_container.dart';
import 'package:doctorapp/color_constant.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: mPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: mPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          isDense: true
        ),
      ),
    );
  }
}