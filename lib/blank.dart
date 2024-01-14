import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Blank extends StatelessWidget {
  const Blank({
    super.key,
    required this.screen,
  });
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.off(screen);
      },
    );
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.yellow,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
