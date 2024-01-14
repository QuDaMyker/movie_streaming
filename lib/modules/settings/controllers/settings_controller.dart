import 'package:get/get.dart';
import 'package:movie_streaming/modules/login/views/login_screen.dart';
import 'package:movie_streaming/services/supabase_services.dart';

class SettingsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> logOut() async {
    try {
      await SupabaseServices().signOut();
      Get.offAll(const LoginScreen());
    } catch (e) {
      print(e.toString());
    }
  }
}
