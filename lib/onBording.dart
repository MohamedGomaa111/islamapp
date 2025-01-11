import 'package:flutter/material.dart';
import 'package:islamapp/AppAssits.dart';
import 'package:islamapp/home/homeScrean.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});
  static const String routeName = "OnBording";

  @override
  State<OnBording> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBording> {
  int currentPage = 0;

  // قائمة الصور
  List<String> images = [
    Appassits.introduction1,
    Appassits.introduction2,
    Appassits.introduction3,
    Appassits.introduction4,
    Appassits.introduction5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView لعرض الصور
          PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) => Image.asset(
              images[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // زر التخطي (Skip)
          Positioned(
            top: 40,
            right: 20,
            child: Visibility(
              visible: currentPage !=
                  images.length - 1, // يظهر فقط إذا لم تكن الصفحة الأخيرة
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScrean.routeName);
                  setState(() {
                    //   currentPage = images.length - 1; // انتقل إلى الصفحة الأخيرة
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // زر الفنش (Finish)
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Visibility(
              visible: currentPage ==
                  images.length - 1, // يظهر فقط في الصفحة الأخيرة
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // اكتب هنا العملية التي تحدث عند الضغط على Finish
                    Navigator.pushReplacementNamed(
                        context, HomeScrean.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Finish",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // المؤشرات (Dots)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
