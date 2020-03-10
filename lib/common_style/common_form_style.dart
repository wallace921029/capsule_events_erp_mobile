import 'package:flutter/material.dart';

InputDecoration formInputDecoration(String prefixText, String helperText, {double prefixWidth = 24.0}) {
  return new InputDecoration(
    prefixIcon: new Container(
      width: prefixWidth,
      child: new Center(
        child: new Text(prefixText)
      )
    ),
    helperText: helperText,
    contentPadding: new EdgeInsets.all(8.0),
    enabledBorder: new OutlineInputBorder(
      borderSide: new BorderSide(color: new Color(0xFF8A8A8A))
    ),
    focusedBorder: new OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.teal)
    )
  );
}