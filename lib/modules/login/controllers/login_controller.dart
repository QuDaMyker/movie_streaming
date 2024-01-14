import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/main.dart';
import 'package:movie_streaming/modules/root_view/views/root_view_screen.dart';
import 'package:movie_streaming/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void onInit() {
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        Get.offAll(const RootViewScreen());
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    _authSubscription.cancel();
    super.onClose();
  }

  Future<void> requestLoginWithEmail() async {
    try {
      AuthResponse? response =
          await SupabaseServices().loginWithEmailAndPassword(
        emailTextController.text.toString().trim(),
        passwordTextController.text.toString().trim(),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> requestLoginWithGoogle() async {
    try {
      await SupabaseServices().signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }
}
