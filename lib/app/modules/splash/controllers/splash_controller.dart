import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3),() {
      Get.offAllNamed(Routes.HOME);
    },);
    super.onInit();
  }

}
