import 'package:beit_rent/app/data/models/booking_model.com.dart';
import 'package:get/get.dart';
import '../../../data/providers/api_provider.dart';

class BookingController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<List<Booking>> bookings=Rx<List<Booking>>([]);
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
          bookings.value.addAll(bookingFromJson(result.bodyString!).toList());
          isLoadingBooking.value=false;
       }else{
         isLoadingBooking.value=false;
       }
    }catch(e){

    }

   }
}
