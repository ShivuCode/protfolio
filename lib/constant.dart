import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

toast(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    duration: Duration(milliseconds: 500),
    content: Text("Projects Deleted"),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Vx.purple400,
  ));
}
