import 'package:flutter/material.dart';
import 'package:torino/constants/colors.dart';

Widget formFields(
    TextEditingController textEditingController, String hintText) {
  return Container(
    decoration: BoxDecoration(
      color: AppTheme.backgroundColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextFormField(
      textDirection: TextDirection.rtl,
      controller: textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText should not be null';
        }
        return null;
      },
      style: TextStyle(
        color: AppTheme.secondaryColor,
        fontFamily: AppTheme.fontFamilyName,
      ),
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: TextStyle(color: AppTheme.secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.secondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.secondaryColor),
        ),
      ),
    ),
  );
}
