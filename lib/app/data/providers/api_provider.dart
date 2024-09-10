import 'package:beit_rent/app/data/api_constants.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect{

  @override
  void onInit() {
    httpClient.baseUrl = 'https://beit-rent-api.onrender.com';
    super.onInit();
  }

  //all property
  Future<Response?> getAllProperty() async {
    try {
      final response = await get(ApiConstants.propertyUrl);
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }

}