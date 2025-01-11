import 'package:flutter/material.dart';
import 'package:islamapp/AppColors.dart';

class Mythamedata {
  static final darktheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Appcolors.blackColor,
        titleTextStyle: TextStyle(
            color: Appcolors.primaryDark,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        iconTheme: IconThemeData(color: Appcolors.primaryDark),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Appcolors.primaryDark,
        selectedItemColor: Appcolors.whiteColor,
        unselectedItemColor: Appcolors.blackColor,
        selectedLabelStyle: TextStyle(fontSize: 15),
        showSelectedLabels: true,
      ));
}
