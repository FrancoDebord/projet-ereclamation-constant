// import 'package:flutter/material.dart';

class HealthModel {
   String icon;
   String value;
   String title;
   final Function()? onTap;
   HealthModel(
      {required this.icon, required this.value, required this.title, this.onTap});
}
