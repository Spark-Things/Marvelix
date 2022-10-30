import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/Downlord.dart';
import 'package:netflix_clone/Pages/Homepage.dart';
import 'package:netflix_clone/Pages/comingSoon.dart';
import 'package:netflix_clone/Pages/more.dart';
import 'package:netflix_clone/Pages/pracfetch.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:netflix_clone/Pages/search.dart';

void main() {
  runApp(MaterialApp(home: Main()));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

     int selecteditem = 0;
    PageController pageController = PageController();
    void tapped(int PageView) {
      setState(() {
        selecteditem = PageView;
      });
      pageController.jumpToPage(PageView);
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: Colors.black87,
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.home,
            title: "Map",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.search,
            title: "Search",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.movie,
            title: "Coming Soon",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.download,
            title: "Download",
          )
        ],
        onTap: tapped,
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          Search(),
          ComingSoon(),
          Download(),
          More()
        ],
        onPageChanged: ((value){
          setState(() {
            selecteditem = value;
          });
        }),
      )
    );
  }
}