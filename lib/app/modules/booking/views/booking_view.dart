import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});
  @override
  Widget build(BuildContext context) {
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
        body: const Center(
          child: Text(
            'BookingView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
