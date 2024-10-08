import 'package:beit_rent/app/controllers/global_controller.dart';
import 'package:beit_rent/app/modules/account/views/account_view.dart';
import 'package:beit_rent/app/modules/booking/views/booking_view.dart';
import 'package:beit_rent/app/modules/favorite/views/favorite_view.dart';
import 'package:beit_rent/app/modules/home/views/home_dashbord_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeDashBordView(),
              if (Get.find<GlobalController>().isLogIn.value)
                const BookingView(),
              const FavoriteView(),
              const AccountView()
            ],
          ),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                showUnselectedLabels: true,
                currentIndex: controller.bottomNavIndex.value,
                onTap: (value) {
                  controller.bottomNavIndex.value = value;
                  _pageController.jumpToPage(value);
                },
                items: [
                  const BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
                  if (Get.find<GlobalController>().isLogIn.value)
                    const BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.book), label: "Booking"),
                  const BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.solidHeart),
                      label: "Saved"),
                  const BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.solidUser),
                      label: "Account"),
                ])));
  }
}
