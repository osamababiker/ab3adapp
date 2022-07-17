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
        borderRadius: BorderRadius.circular(20),
        gapPadding: 10,
      );

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 42),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: kTextColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(kDefaultPadding * 2),
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
      color: Colors.black
    ),
    textTheme: TextTheme(
      headline6: const TextStyle(
        color: Color(0xFF3C4046),
        fontSize: 18,
        fontFamily: kFontFamily 
      ),
    ), systemOverlayStyle: SystemUiOverlayStyle.dark
  );
}