import 'package:beit_rent/app/controllers/global_controller.dart';
import 'package:beit_rent/app/modules/auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/colorConstant.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Account',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx(() => !Get.find<GlobalController>().isLogIn.value
                ? AuthView()
                : controller.isLoadUser.value
                    ? Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: ColorConstant.primaryColor,
                          size: 40,
                        ),
                      )
                    : SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width,
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                leading: const CircleAvatar(),
                                title: Text(controller
                                        .customer.value.customer?.firstName ??
                                    ""),
                                subtitle: Text(
                                    controller.customer.value.customer?.email ??
                                        ""),
                                trailing: const FaIcon(
                                  FontAwesomeIcons.pen,
                                  size: 17,
                                ),
                              ),
                            ),
                            const Text(
                              'General',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Container(
                                width: Get.width,
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Column(
                                  children: [
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.language),
                                      title: Text("Change Language"),
                                      trailing: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 17,
                                      ),
                                    ),
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.lock),
                                      title: Text("Change Password"),
                                      trailing: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 17,
                                      ),
                                    ),
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.bell),
                                      title: Text("Notification"),
                                      trailing: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                )),
                            const Text(
                              'Support',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Container(
                                width: Get.width,
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Column(
                                  children: [
                                    ListTile(
                                      leading:
                                          FaIcon(FontAwesomeIcons.shieldHalved),
                                      title: Text("Privacy Policy"),
                                      trailing: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 17,
                                      ),
                                    ),
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.info),
                                      title: Text("About"),
                                      trailing: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                width: Get.width,
                                margin:
                                const EdgeInsets.only(top:5, bottom: 10),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () => controller.logout(),
                                      leading: const FaIcon(
                                          FontAwesomeIcons.arrowRightFromBracket,color: Colors.redAccent,),
                                      title: const Text("LogOut",style: TextStyle(color: Colors.redAccent),),
                                      trailing: const FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        color: Colors.redAccent,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                    ))));
  }
}
