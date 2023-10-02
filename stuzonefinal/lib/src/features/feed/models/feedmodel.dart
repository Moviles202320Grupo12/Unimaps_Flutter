import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final Function onPressed;

  ButtonModel({
    required this.text,
    required this.onPressed,
  });
}