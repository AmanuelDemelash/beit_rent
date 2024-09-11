import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Get.back(), icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
        title: const Text('Notification'),
        centerTitle: true,
      ),
      body:const Column(
        children: [

        ],
      ),
    );
  }
}
