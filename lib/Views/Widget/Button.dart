import 'package:flutter/material.dart';
import 'package:olx/Models/Theme.dart';

final ButtonStyle buttonPrimary =  ElevatedButton.styleFrom(
  primary: blueColor,
  elevation: 0, 
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50))
  )
);