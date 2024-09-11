import 'package:beit_rent/app/controllers/global_controller.dart';
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/providers/api_provider.dart';

class AuthController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  RxBool showPassword=true.obs;
  RxBool isSignUp=false.obs;
  RxBool isLoginLoading=false.obs;
  @override
  void onInit() {
    super.onInit();
  }


  Future<void> customerLogin(Map<String,dynamic> data)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoginLoading.value=true;
    try{
      var result=await _apiProvider.loginCustomer(data);
      if(result.statusCode==200){
       await prefs.setString('token', result.body['data']["token"]);
        await prefs.setString('id', result.body['data']["customer"]['_id']);
       Get.find<GlobalController>().user.value=result.body['data']['customer'];
       Get.find<GlobalController>().getToken();
        isLoginLoading.value=false;
      Get.offAllNamed(Routes.HOME);
      }else{
        isLoginLoading.value=false;
        Get.rawSnackbar(title: 'error',message: result.body['message'],backgroundColor:Colors.redAccent);
      }
    }catch(e){
      isLoginLoading.value=false;
    }
  }


  Future<void> registerCustomer(Map<String,dynamic> data)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isSignUp.value=true;
    try{
      var result=await _apiProvider.signUpCustomer(data);
       if(result.statusCode==201){
         await prefs.setString('token', result.body['data']["token"]);
         await prefs.setString('id', result.body['data']["newCustomer"]['_id']);
         Get.find<GlobalController>().user.value=result.body['data']['newCustomer'];
         Get.find<GlobalController>().getToken();
         isSignUp.value=false;
         Get.offAllNamed(Routes.HOME);
       }else{
         isSignUp.value=false;
         Get.rawSnackbar(title: 'error',message: result.body,backgroundColor:Colors.redAccent);
       }
    }catch(e){
      isSignUp.value=false;
      Get.rawSnackbar(title: "error",message:"$e",backgroundColor: Colors.redAccent);
    }





  }


}
