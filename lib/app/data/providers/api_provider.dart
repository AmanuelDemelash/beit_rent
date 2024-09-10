import 'package:get/get.dart';

class ApiProvider extends GetConnect{

  @override
  void onInit() {
    httpClient.baseUrl = 'https://beit-rent-api.onrender.com';
    super.onInit();
  }
}