import 'package:get/get.dart';
import 'package:movie_streaming/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  Future<void> signInWithGoogle() async {
    try {
      await supabase.auth.signInWithOAuth(OAuthProvider.google);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<AuthResponse?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    AuthResponse? res;
    print(email);
    print(password);

    try {
      res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Auth', 'Check your email');
    } catch (e) {
      print('loi ơ day');
      print(e.toString());
    }
    return res;
  }

  Future<AuthResponse?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    AuthResponse? res;
    print(email);
    print(password);

    try {
      res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      Get.snackbar('Auth', 'Check your email');
    } catch (e) {
      print('loi ơ day');
      print(e.toString());
    }
    return res;
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
