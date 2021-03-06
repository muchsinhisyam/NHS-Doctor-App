import 'package:doctorapp/Screens/Components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../../color_constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key key, this.onChanged, this.hintText, this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(Icons.lock, color: mPrimaryColor,),
//            suffixIcon: Icon(Icons.visibility, color: Colors.white,),
            border: InputBorder.none,
            isDense: true
        ),
      ),
    );
  }
}