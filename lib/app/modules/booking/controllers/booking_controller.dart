import 'package:get/get.dart';
import '../../../data/providers/api_provider.dart';

class BookingController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  RxBool isLoadingBooking=false.obs;
  @override
  void onInit() {
    getCustomerBookings();
    super.onInit();
  }

   Future<void> getCustomerBookings()async{
    isLoadingBooking.value=true;
    try{
      var result= await _apiProvider.getCustomerBooking();
       if(result!.statusCode==200){
          print(result.body);
          isLoadingBooking.value=false;
       }else{
         print(result.body);

       }
    }catch(e){

    }



   }
}
