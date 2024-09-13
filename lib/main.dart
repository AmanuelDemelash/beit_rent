import 'package:beit_rent/app/bindings/app_bindings.dart';
import 'package:beit_rent/app/theme/themeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("favorite");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Biet Rent",
      theme: lightTheme,
      initialBinding: AppBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
