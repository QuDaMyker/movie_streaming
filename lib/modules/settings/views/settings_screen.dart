import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/modules/settings/controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            settingsController.logOut();
          },
          child: const Text('log out'),
        ),
      ),
    );
  }
}
