import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/customer_mode;.dart';
import '../../../data/providers/api_provider.dart';

class AccountController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<Customer> customer=Customer().obs;
  RxBool isLoadUser=false.obs;
  @override
  void onInit() {
    getCustomer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCustomer()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id') ?? "";
    if(id.isNotEmpty){
      isLoadUser.value=false;
      var result= await _apiProvider.getCustomer(id);
      if(result!.statusCode==200){
        customer.value=customerFromJson(result.bodyString!);
        isLoadUser.value=false;
      }else{
        isLoadUser.value=false;

      }
    }

  }


}
