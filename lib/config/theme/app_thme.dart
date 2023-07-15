
import 'package:flutter/material.dart';


class AppTheme {

  

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,

    fontFamily: 'Montserrat',

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18.0),
      bodyMedium: TextStyle(fontSize: 14.0),
      bodySmall: TextStyle(fontSize: 10.0),
    ),
    
    





  );


}