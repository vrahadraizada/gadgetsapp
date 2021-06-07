import 'package:flutter/material.dart';
import 'package:masterapp/screens/cart_screen.dart';
import 'package:masterapp/screens/home_screen.dart';
import 'package:masterapp/screens/login_screen.dart';
import 'package:masterapp/widgets/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
