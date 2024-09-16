import 'package:beit_rent/app/data/api_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider extends GetConnect {
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

  //auth
  Future<Response> signUpCustomer(Map<String, dynamic> data) async {
    try {
      final response = await post(ApiConstants.customerUrl, data);
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }

  //login
  Future<Response> loginCustomer(Map<String, dynamic> data) async {
    try {
      final response = await post("${ApiConstants.customerUrl}/login", data);
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }

  //get customer
  Future<Response?> getCustomer(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await get("${ApiConstants.customerUrl}/$id",
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }

  // booking
  Future<Response?> getCustomerBooking() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await get(ApiConstants.myBookingUrl,
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }

  Future<Response> booking(Map<String, dynamic> data) async {
    try {
      final response = await post(ApiConstants.bookingUrl, data);
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }

  // notification
  Future<Response?> getNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await get(ApiConstants.notificationUrl,
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }
}
