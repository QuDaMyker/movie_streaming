import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_streaming/modules/explore/views/explore_screen.dart';
import 'package:movie_streaming/modules/films/views/films_screen.dart';
import 'package:movie_streaming/modules/root_view/controllers/root_view_controller.dart';
import 'package:movie_streaming/modules/settings/views/settings_screen.dart';
import 'package:movie_streaming/modules/tv_shows/views/tv_show_screen.dart';
import 'package:movie_streaming/modules/watchlists/views/watch_lists_screen.dart';

class RootViewScreen extends StatefulWidget {
  const RootViewScreen({super.key});

  @override
  State<RootViewScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootViewScreen> {
  final rootController = Get.put(RootViewController(), permanent: true);
  late double deviceHeight;
  late double deviceWidth;
  @override
  void initState() {
    print('object');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    final screens = [
      FilmsScreen(),
      TVShowScreen(),
      ExploreScreen(),
      WatchListsScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        onPageChanged: rootController.animateToTab,
        controller: rootController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.05,
            vertical: deviceHeight * 0.01,
          ),
          child: GNav(
            tabActiveBorder: Border.all(
              color: Colors.yellow,
              width: deviceWidth * 0.005,
            ),
            haptic: true,
            curve: Curves.easeOut,
            //duration: const Duration(milliseconds: 200),
            backgroundColor: Colors.black,
            gap: 15,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: deviceHeight * 0.01,
              horizontal: deviceWidth * 0.01,
            ),
            activeColor: Colors.yellow,
            rippleColor: Colors.yellow,
            hoverColor: Colors.yellow,
            tabBackgroundColor: Colors.black,
            onTabChange: (index) {
              rootController.changeScreen(index);
            },
            tabs: const [
              GButton(icon: Icons.movie, text: 'Films'),
              GButton(icon: Icons.tv, text: 'TV Shows'),
              GButton(icon: Icons.search, text: 'Explore'),
              GButton(icon: Icons.view_list_outlined, text: 'WatchLists'),
              GButton(icon: Icons.person_outline, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
