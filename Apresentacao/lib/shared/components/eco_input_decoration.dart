import 'package:flutter/material.dart';

InputDecoration ecoInputDecoration({required String labelText, required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
  );
}
