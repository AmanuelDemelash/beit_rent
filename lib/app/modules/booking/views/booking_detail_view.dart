import 'package:beit_rent/app/data/models/booking_model.com.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingDetailView extends GetView {
  BookingDetailView({super.key});
  final Booking booking = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Detail'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 0.1,
                        color: Colors.white.withOpacity(0.9),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:
                                  booking.property!.image!.first.toString(),
                              placeholder: (context, url) =>
                                  Image.asset("assets/images/placeholder.png"),
                              errorWidget: (context, url, error) =>
                                  const FaIcon(FontAwesomeIcons.image),
                              fit: BoxFit.cover,
                              width: Get.width,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        color: Colors.white.withOpacity(0.9),
                        child: Column(
                          children: [
                            const Text(
                              "Booking Details",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "start date:",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(DateFormat('yyyy-MM-dd')
                                    .format(booking.startDate!)
                                    .toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "end date:",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(DateFormat('yyyy-MM-dd')
                                    .format(booking.endDate!)
                                    .toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "booked date:",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(DateFormat('yyyy-MM-dd')
                                    .format(booking.createdAt!)
                                    .toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "status:",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(booking.status!.toString())
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        color: Colors.white.withOpacity(0.9),
                        child: Column(
                          children: [
                            const Text(
                              "Owner Details",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name:",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(booking.property!.owner!.firstName!)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Contact",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(booking.property!.owner!.phoneNumber!)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        color: Colors.white.withOpacity(0.9),
                        child: Column(
                          children: [
                            const Text(
                              "Price Summery",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Apartment price:",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(booking.property!.price.toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Service charge",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(booking.property!.price.toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(booking.property!.price.toString())
                              ],
                            )
                          ],
                        ),
                      ),
                      Card(
                        elevation: 0.1,
                        color: Colors.white.withOpacity(0.9),
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SfDateRangePicker(
                              initialSelectedRange: PickerDateRange(
                                  booking.startDate, booking.endDate),
                              allowViewNavigation: true,
                              selectionMode: DateRangePickerSelectionMode.range,
                              backgroundColor: Colors.white,
                              onSelectionChanged:
                                  (DateRangePickerSelectionChangedArgs args) {},
                              headerStyle: const DateRangePickerHeaderStyle(
                                  backgroundColor: Colors.white,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}
