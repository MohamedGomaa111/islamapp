import 'package:flutter/material.dart';
import 'package:islamapp/AppAssits.dart';
import 'package:islamapp/AppColors.dart';
import 'package:islamapp/home/tabs/quranTab/suraListWidget.dart';
import 'package:islamapp/home/tabs/quranTab/sura_details_screan.dart';
import 'package:islamapp/model/sura_model.dart';

// ignore: must_be_immutable
class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      //color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(Appassits.logo),
          TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Appcolors.whiteColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Appcolors.primaryDark, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Appcolors.primaryDark, width: 2)),
                prefixIcon: ImageIcon(
                    color: Appcolors.primaryDark,
                    AssetImage(Appassits.icon_search)),
                hintText: "soura Name",
                hintStyle: TextStyle(color: Appcolors.primaryDark),
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Most Recently",
            style: TextStyle(color: Appcolors.primaryDark, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Appcolors.primaryDark,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("sura EG"),
                    Text("sura AR"),
                    Text("sura Number"),
                  ],
                ),
                Image.asset(Appassits.most_Recenttly)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Suras List",
            style: TextStyle(fontSize: 16, color: Appcolors.primaryDark),
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                indent: 25.5,
                endIndent: 25.5,
                color: Appcolors.whiteColor,
                thickness: 2,
              );
            },
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SuraDetailsScrean.routeName,
                      arguments: SuraModel.getsuraModel(index));
                },
                child: Suralistwidget(
                  suraModel: SuraModel.getsuraModel(index),
                ),
              );
            },
            itemCount: SuraModel.getItemCount(),
          ))
        ],
      ),
    );
  }
}
