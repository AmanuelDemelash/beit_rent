import 'package:get/get.dart';

import '../controllers/apartment_detail_controller.dart';

class ApartmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentDetailController>(
      () => ApartmentDetailController(),
    );
  }
}
