import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {

  RxBool isLogIn=false.obs;

  RxMap<String,dynamic> user=RxMap<String,dynamic>();

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token') ?? "";
    String? id = prefs.getString('id') ?? "";
    if (token.isNotEmpty) {
      isLogIn.value = true;
    }
  }


}
