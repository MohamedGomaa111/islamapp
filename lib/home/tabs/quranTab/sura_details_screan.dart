import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamapp/AppAssits.dart';
import 'package:islamapp/AppColors.dart';
import 'package:islamapp/home/tabs/quranTab/sura_contant_item.dart';
import 'package:islamapp/model/sura_model.dart';

class SuraDetailsScrean extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetailsScrean> createState() => _SuraDetailsScreanState();
}

class _SuraDetailsScreanState extends State<SuraDetailsScrean> {
  List<String> virses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (virses.isEmpty) {
      loodSuraFiles(args.index);
    }

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      appBar: AppBar(
        title: Text(
          args.SuraEnglishName,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Appassits.ditels_bg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(height: 15),
              Text(
                args.SuraArabicName,
                style: TextStyle(
                    color: Appcolors.primaryDark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: virses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Appcolors.primaryDark,
                      ))
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SuraContantItem(
                            contant: virses[index],
                          );
                        },
                        itemCount: virses.length,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }

  void loodSuraFiles(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/file/${index + 1}.txt');
    List<String> suraLines = suraContent.split("/n");
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    virses = suraLines;
    setState(() {});
  }
}
