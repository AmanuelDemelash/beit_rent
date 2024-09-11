import 'package:beit_rent/app/controllers/global_controller.dart';
import 'package:get/get.dart';

import '../data/providers/api_provider.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ApiProvider());
    Get.put(GlobalController());
  }

}