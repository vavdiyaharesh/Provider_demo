import 'package:flutter/material.dart';


const baseUrl='https://reqres.in';

Widget appBar(String tittle){
   return AppBar(
     title: Text(tittle),
   );
 }

Widget customTextField(
    {String labelText,
      String hintText,
      Function validation,
      Widget suffix,
      Function onSaved,
      int maxLength,
      bool obscureText,
      Widget suffixIcon,
      Function onPress,
      Function onChanged,
      Function onFieldSubmitted,
      TextInputType textInputType,
      bool readOnly}) {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    width: double.infinity,
    child: TextFormField(
        onChanged: onChanged ??null,
        onFieldSubmitted: onFieldSubmitted??null,
        onSaved: onSaved??null,
        maxLength: maxLength ?? null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.black),
        onTap: onPress ?? null,
        readOnly: readOnly ?? false,
        validator: validation,
        obscureText: obscureText ?? false,
        keyboardType: textInputType ?? null,
        decoration: InputDecoration(
          suffix: suffix ?? null,
          suffixIcon: suffixIcon ?? null,
          suffixStyle: TextStyle(color: Colors.blue),
          labelText: labelText ?? null,
          labelStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12),
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blueAccent,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        )),
  );
}