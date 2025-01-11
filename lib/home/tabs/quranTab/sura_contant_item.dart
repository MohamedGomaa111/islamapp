import 'package:flutter/material.dart';
import 'package:islamapp/AppColors.dart';

class SuraContantItem extends StatelessWidget {
  String contant;

  SuraContantItem({required this.contant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Appcolors.primaryDark, width: 2)),
      child: Column(
        children: [
          Text(
            "${contant}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Appcolors.whiteColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
