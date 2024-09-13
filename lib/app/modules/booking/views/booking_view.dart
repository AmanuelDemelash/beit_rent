import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/colorConstant.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booked Apartments'),
          centerTitle: true,
          bottom: const TabBar(
              tabs:[
            Tab(text: "Active",),
            Tab(text: "Rejected",),
            Tab(text: "Completed",),
          ]),
        ),
        body:Obx(() =>SizedBox(width: Get.width,
        height: Get.height,
          child: controller.isLoadingBooking.value? Center(
            child:LoadingAnimationWidget.fourRotatingDots(
              color: ColorConstant.primaryColor,
              size:40,
            ),
          ):controller.bookings.value.isEmpty?const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Noting Found',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                Text('you have no saved apartment',
                ),
              ],
            ),
          ):
          RefreshIndicator(
            onRefresh: ()async{
              controller.getCustomerBookings();
            },
            color: ColorConstant.primaryColor,
            child: ListView.builder(
              padding:const EdgeInsets.all(10),
              itemCount: controller.bookings.value.length,
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                elevation: 0.1,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            width: 60,
                            height:60,
                            child:
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:CachedNetworkImage(imageUrl:controller.bookings.value[index].property!.image![0],
                                placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                                errorWidget: (context, url, error) =>const FaIcon(FontAwesomeIcons.image),
                                fit: BoxFit.cover,width:90,height: 90,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                controller.bookings.value[index].property!.name!,
                                style:const TextStyle(fontSize:18),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.locationDot,
                                        size: 15,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 3,),
                                      Expanded(
                                        child: Text(controller.bookings.value[index].property!.absoluteLocation!.address!,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text(
                                        "${controller.bookings.value[index].property!.price} ETB",
                                        style: const TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      const Text(" per 1 day")
                                    ],
                                  ),
                                  const SizedBox(height: 5,),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top:2, bottom:2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: ColorConstant.primaryColor, // Border color
                                width: 1.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child:Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.certificate,
                                  size: 14,
                                  color: ColorConstant.primaryColor,
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  controller.bookings.value[index].property!.verification!.status!,
                                  style: const TextStyle(color: ColorConstant.primaryColor),
                                )
                              ],
                            ),
                          ),
                          Text(DateFormat('yyyy-MM-dd').format(controller.bookings.value[index].startDate!).toString())
                        ],
                      )
                    ],
                  ),
                ),
              )
              ,),
          )
          ,
        ))

      ),
    );
  }
}
