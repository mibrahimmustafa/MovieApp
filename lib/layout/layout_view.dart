import 'package:flutter/material.dart';
import 'package:movie_app/modules/Home/page/home_view.dart';
import 'package:movie_app/modules/browse/page/browse_View.dart';
import 'package:movie_app/modules/watchList/page/watchList_View.dart';

import '../modules/search/search_screen.dart';

class layoutView extends StatefulWidget {
  static const String routeName="layout";

   layoutView({super.key});

  @override
  State<layoutView> createState() => _layoutViewState();
}

class _layoutViewState extends State<layoutView> {
  int currentIndex=0;
  List<Widget> screens=[
    const homeView(),
    SearchScreen(),
    browseView(),
     watchListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex=index;
            });
          },
          items: const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/bottonNavigationBar/Home icon.png")),label: "HOME"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/bottonNavigationBar/search icon.png")),label: "SEARCH"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/bottonNavigationBar/browse icon.png")),label: "BROWSE"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/bottonNavigationBar/watchList icon.png")),label: "WATCHLIST"),
      ]
      ),
    );
  }
}
