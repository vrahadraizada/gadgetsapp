import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color(0xFFf5f5f5),
          iconTheme: IconThemeData(color: Colors.grey[900]),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

  //colors
  static Color creamColor = Color(0xFFf5f5f5);
  static Color greyColor = Colors.grey[900]; //Color(0xFF403B58);
}

/*

final kTheme = ThemeData(
  primaryColor: Colors.grey[900],
  accentColor: Colors.white,
  scaffoldBackgroundColor: Colors.white70,
  brightness: Brightness.dark,
  fontFamily: 'Acme',
  cardColor: Colors.grey[900],
);

final kCardShape = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(20),
);

final kBottomCardShap = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);


*/
