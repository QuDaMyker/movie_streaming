import 'package:get/get.dart';
import 'package:movie_streaming/main.dart';
import 'package:movie_streaming/modules/login/views/login_screen.dart';
import 'package:movie_streaming/modules/root_view/views/root_view_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _redirect();
    super.onInit();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    final sesssion = supabase.auth.currentSession;
    if (sesssion != null) {
      Get.offAll(const RootViewScreen());
    } else {
      Get.offAll(LoginScreen());
    }
  }
}
