import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class OverViewView extends GetView {
  const OverViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Get.back(), icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
        title: const Text('OverView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OverViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
