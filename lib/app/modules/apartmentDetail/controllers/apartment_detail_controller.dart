
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/providers/api_provider.dart';

class ApartmentDetailController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  RxBool isBooking=false.obs;
  RxString startDate=''.obs;
  RxString endDate=''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> booking(String propId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id') ?? "";
    if(id.isNotEmpty && startDate.value.isNotEmpty && endDate.value.isNotEmpty){
      isBooking.value=true;
      Map<String,dynamic> data={
        "customer":id ,
        "property":propId ,
        "startDate":startDate.value,
        "endDate":endDate.value,
      };
       var result= await _apiProvider.booking(data);
       if(result.statusCode==201){
         isBooking.value=false;
         Get.rawSnackbar(title: "Booked",message: "booked successfully",backgroundColor:Colors.green);
         Get.offAllNamed(Routes.HOME);
       }else{
         isBooking.value=false;
       }
    }

  }
}
