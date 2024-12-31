import 'package:flutter/material.dart';
import 'package:torino/constants/colors.dart';
Widget customButton(double percent,String text,BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppTheme.primaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    width: MediaQuery.sizeOf(context).width * percent,
    child: TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: AppTheme.backgroundColor,fontFamily: AppTheme.fontFamilyName,),
      ),
    ),
  );
}