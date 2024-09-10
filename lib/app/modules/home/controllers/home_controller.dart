import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/property.dart';
import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<List<Property>> allProperty = RxList<Property>().obs;
  RxInt bottomNavIndex = 0.obs;
  RxBool viewModeList=false.obs;
  RxBool isLoadingAllProperty=false.obs;

  @override
  void onInit() {
    getAllProperty();
    super.onInit();
  }

  Future<void> getAllProperty()async{
    isLoadingAllProperty.value=true;
    try{
      var result= await _apiProvider.getAllProperty();
      if(result!.statusCode==200){
          allProperty.value.addAll(propertyFromJson(result.bodyString!).toList());
          isLoadingAllProperty.value=false;
      }else{
        Get.rawSnackbar(message: "something went wrong",backgroundColor: Colors.redAccent);
      }
    }catch(e){
       Get.rawSnackbar(message: "something went wrong",backgroundColor: Colors.redAccent);
    }

  }
}
