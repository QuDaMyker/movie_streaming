import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_streaming/home/explore/views/explore_screen.dart';
import 'package:movie_streaming/home/films/views/films_screen.dart';
import 'package:movie_streaming/home/root_view/controllers/root_view_controller.dart';
import 'package:movie_streaming/home/settings/views/settings_screen.dart';
import 'package:movie_streaming/home/tv_shows/views/tv_show_screen.dart';
import 'package:movie_streaming/home/watchlists/views/watch_lists_screen.dart';

class RootViewScreen extends StatefulWidget {
  const RootViewScreen({super.key});

  @override
  State<RootViewScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootViewScreen> {
  final rootController = Get.put(RootViewController(), permanent: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //rootController.setIsOnline(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const FilmsScreen(),
      const TVShowScreen(),
      const ExploreScreen(),
      const WatchListsScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          child: GNav(
            tabActiveBorder: Border.all(color: Colors.yellow, width: 1),
            haptic: true,
            //curve: Curves.easeOut,
            //duration: const Duration(milliseconds: 200),
            backgroundColor: Colors.white,
            gap: 15,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            activeColor: Colors.yellow,
            rippleColor: Colors.yellow,
            hoverColor: Colors.yellow,
            tabBackgroundColor: Colors.black,
            onTabChange: (index) {
              rootController.changeScreen(index);
            },
            tabs: const [
              GButton(icon: Icons.home_outlined, text: 'Films'),
              GButton(icon: Icons.home_work_outlined, text: 'TV Shows'),
              GButton(icon: Icons.sms_outlined, text: 'Explore'),
              GButton(icon: Icons.person_outline, text: 'WatchLists'),
              GButton(icon: Icons.person_outline, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
