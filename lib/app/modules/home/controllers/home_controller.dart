import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/property.dart';
import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<List<Property>> allProperty = RxList<Property>().obs;
  RxInt bottomNavIndex = 0.obs;
  RxBool viewModeList=false.obs;
  RxBool isLoadingAllProperty=false.obs;
  RxMap<String,dynamic> user=RxMap<String,dynamic>();

  @override
  void onInit() {
    getAllProperty();
    getCustomer();
    super.onInit();
  }

  Future<void> getAllProperty()async{
    isLoadingAllProperty.value=true;
    try{
      var result= await _apiProvider.getAllProperty();
      if(result!.statusCode==200){
          allProperty.value.addAll(propertyFromJson(result.bodyString!).toList());
          isLoadingAllProperty.value=false;
      }
    }catch(e){
      isLoadingAllProperty.value=false;
       Get.rawSnackbar(message: "something went wrong",backgroundColor: Colors.redAccent);
    }

  }


  Future<void> getCustomer()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id') ?? "";
    if(id.isNotEmpty){
      var result= await _apiProvider.getCustomer(id);
      if(result!.statusCode==200){
        user.value=result.body['data']['newCustomer'];
        print(user.values);
      }else{
        print(result.body);
      }
    }

  }
}
