import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';


ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200, 
    fontFamily: kFontFamily, 
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ); 
}
 
InputDecorationTheme inputDecorationTheme() { 
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        gapPadding: 10,
      );

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 42),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: kTextColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5),
        ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: kTextColor.withOpacity(0.5)),
        ), 
      border: outlineInputBorder, 
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor,fontFamily: kFontFamily),
    bodyText2: TextStyle(color: kTextColor,fontFamily: kFontFamily)
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: kTextColor
    ),
    
  );
}