import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:flutter/material.dart';


Widget customTextField({String? title, String? hint, controller, focusNode,required obscureText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(deeppurple).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: obscureText,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontFamily: semibold, color: grey),
            isDense: true,
            fillColor: liteGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: deeppurple))),
      )
    ],
  );
}
