import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  late StreamSubscription subscription;
  RxBool isLogIn = false.obs;
  RxMap<String, dynamic> user = RxMap<String, dynamic>();

  @override
  void onInit() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      // Received changes in available connectivity types!
      for (var element in result) {
        if (element == ConnectivityResult.none) {
          Get.rawSnackbar(
              title: "connection lost",
              message: "please cheek your internet connection",
              backgroundColor: Colors.redAccent,
              icon: const Icon(Icons.signal_wifi_connected_no_internet_4),
              isDismissible: false,
              barBlur: 0.9,
              duration: const Duration(days: 1));
        } else {
          if (Get.isSnackbarOpen) {
            Get.closeCurrentSnackbar();
          }
        }
      }
    });
    getToken();
    super.onInit();
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token') ?? "";
    if (token.isNotEmpty) {
      isLogIn.value = true;
    }
  }
}
