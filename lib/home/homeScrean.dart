import 'package:flutter/material.dart';
import 'package:islamapp/AppAssits.dart';
import 'package:islamapp/AppColors.dart';
import 'package:islamapp/home/tabs/hadethTab/hadethTab.dart';
import 'package:islamapp/home/tabs/quranTab/quran.dart';
import 'package:islamapp/home/tabs/radioTab/radioTab.dart';
import 'package:islamapp/home/tabs/sephaTab/sephaTab.dart';
import 'package:islamapp/home/tabs/timeTab/time.dart';

class HomeScrean extends StatefulWidget {
  static const String routeName = 'HomeScrean';

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  int selectIndix = 0;
  List<String> backgroundtabs = [
    Appassits.quran_bg,
    Appassits.hadeth_bg,
    Appassits.sebhaBG,
    Appassits.radio_bg,
    Appassits.time_bg
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SephaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundtabs[selectIndix],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: tabs[selectIndix],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Appcolors
                    .primaryDark), //== type: BottomNavigationBarType.fixed,
            child: BottomNavigationBar(
                //في اي نافيكيشن بار في اي ابلكيشن لازم نحط الخطوات دي تمام
                currentIndex: selectIndix,
                onTap: (index) {
                  selectIndix = index;
                  setState(() {});
                },

                // type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: buildItenInBattomNavBar(
                          index: 0, imageName: Appassits.icon_quran),
                      label: "quran"),
                  BottomNavigationBarItem(
                      icon: buildItenInBattomNavBar(
                          index: 1, imageName: Appassits.icon_hadith),
                      label: "hadith"),
                  BottomNavigationBarItem(
                      icon: buildItenInBattomNavBar(
                          index: 2, imageName: Appassits.icon_sepha),
                      label: "sepha"),
                  BottomNavigationBarItem(
                      icon: buildItenInBattomNavBar(
                          index: 3, imageName: Appassits.icon_radio),
                      label: "radio"),
                  BottomNavigationBarItem(
                      icon: buildItenInBattomNavBar(
                          index: 4, imageName: Appassits.icon_time),
                      label: "time"),
                ]),
          ),
        )
      ],
    );
  }

  Widget buildItenInBattomNavBar(
      {required int index, required String imageName}) {
    return selectIndix == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 19),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Appcolors.blackBGNBColor),
            child: Image.asset(imageName))
        : Image.asset(imageName);
  }
}
