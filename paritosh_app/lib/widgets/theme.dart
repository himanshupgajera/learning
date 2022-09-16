import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
          appBarTheme: AppBarTheme(
        color: Theme.of(context).primaryColorLight,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
