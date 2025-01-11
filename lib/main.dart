import 'package:flutter/material.dart';
import 'package:islamapp/home/homeScrean.dart';
import 'package:islamapp/home/tabs/quranTab/sura_details_screan.dart';
import 'package:islamapp/myThameData.dart';
import 'package:islamapp/onBording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBording.routeName,
      routes: {
        OnBording.routeName: (context) => OnBording(),
        HomeScrean.routeName: (context) => HomeScrean(),
        SuraDetailsScrean.routeName: (context) => SuraDetailsScrean(),
      },
      darkTheme: Mythamedata.darktheme,
      themeMode: ThemeMode.dark,
    );
  }
}
