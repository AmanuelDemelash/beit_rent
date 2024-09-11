import 'package:beit_rent/app/data/models/property.dart';
import 'package:beit_rent/app/modules/apartmentDetail/controllers/apartment_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookView extends GetView<ApartmentDetailController> {
  BookView({super.key});

  Property property=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Get.back(), icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
        title: const Text('Booking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              elevation: 0.1,
              color: Colors.white.withOpacity(0.9),
              child:
            Padding(
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(imageUrl:property.image![0].toString(),
                  placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                  errorWidget: (context, url, error) =>const FaIcon(FontAwesomeIcons.image),
                  fit: BoxFit.cover,width: Get.width,
                  height: 120,
                ),
              ),
            ),),
            Expanded(
              child:Card(
                  elevation: 0.1,
                  color: Colors.white.withOpacity(0.9),
                  child: Container(  width: Get.width,
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SfDateRangePicker(
                        allowViewNavigation: true,
                        selectionMode: DateRangePickerSelectionMode.range,
                        backgroundColor: Colors.white,
                        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                           controller.startDate.value= DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
                           controller.endDate.value= DateFormat('yyyy-MM-dd').format(args.value.endDate!=null?args.value.endDate:DateTime.now()).toString();
                        },
                        headerStyle: const DateRangePickerHeaderStyle(backgroundColor: Colors.white,textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
              ),
            Container(
              width: Get.width,
              padding:const EdgeInsets.all(15),
              child:Obx(() =>ElevatedButton(onPressed:() {
                if(controller.startDate.value.isNotEmpty && controller.endDate.value.isNotEmpty){
                  Get.bottomSheet(BottomSheet(onClosing:() {}, builder:(context) => Container(
                    width: Get.width,
                    height: Get.height/1.4,
                    padding:const EdgeInsets.all(15),
                    child:Column(
                      children: [
                       const ListTile(
                          title:Text("Terms of Booking",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          trailing:FaIcon(FontAwesomeIcons.ban) ,
                        ),
                       const ListTile(
                          title:Text("Cancellation Policy",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          subtitle: Text("free cancellation before 15:00 on 27 sep. cancel before check in "),
                        ),
                        const ListTile(
                          title:Text("Ground Rules",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          subtitle: Text("free cancellation before 15:00 on 27 sep. cancel before check in "),
                        ),
                        const ListTile(
                          subtitle: Text("By selecting the button, i agree to the booking term"),
                        ),
                        Container(
                          margin:const EdgeInsets.only(top: 10),
                          width: Get.width,
                          child:ElevatedButton(onPressed:(){
                            controller.booking(property.id!);
                            Get.back();
                          }, style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.all(15)
                          ), child:const Text("Request to Book",style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    ),
                  ),));
                }
              }, style: ElevatedButton.styleFrom(
                    padding:const EdgeInsets.all(15)
                  ),
                  child:controller.isBooking.value?LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white,
                    size:30,
                  ):
                const Text("Place Order",style: TextStyle(color: Colors.white),)),
            ))
          ],
        ),
      )
    );
  }
}
