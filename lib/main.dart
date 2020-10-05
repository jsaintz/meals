import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Colors.grey[50],
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontSize: 20,fontFamily: 'RobotCondensed',
            )
          ),),
      home: CategoriesScreen(),
    );
  }
}
