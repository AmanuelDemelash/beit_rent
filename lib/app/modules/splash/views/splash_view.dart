import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController>{
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Stack(children: [
          Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset("assets/images/buildings_pic.png")),
         Center(
            child: Image.asset("assets/images/primary.png",
              width: Get.width-200,
            )
        ),

      ])


    );
  }
}
