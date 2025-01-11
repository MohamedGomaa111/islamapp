import 'package:flutter/material.dart';
import 'package:islamapp/AppAssits.dart';
import 'package:islamapp/AppColors.dart';
import 'package:islamapp/model/sura_model.dart';

// ignore: must_be_immutable
class Suralistwidget extends StatelessWidget {
  SuraModel suraModel;
  Suralistwidget({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(Appassits.vector_image),
            Text(
              "${suraModel.index + 1}",
              style: TextStyle(color: Appcolors.whiteColor),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraModel.SuraEnglishName,
                    style: TextStyle(color: Appcolors.whiteColor),
                  ),
                  Text(
                    "${suraModel.NumberOfVerses}Verses ",
                    style: TextStyle(color: Appcolors.whiteColor, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(children: [
          Text(
            suraModel.SuraArabicName,
            style: TextStyle(color: Appcolors.whiteColor),
          ),
        ])
      ],
    );
  }
}
