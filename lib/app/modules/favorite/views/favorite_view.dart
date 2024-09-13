import 'package:beit_rent/app/modules/home/controllers/home_controller.dart';
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../constants/colorConstant.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    controller.getFavorites();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Apartments'),
          centerTitle: true,
        ),
        body:Obx(() => controller.allFavorite.isEmpty
            ? SizedBox(
          width: Get.width,
          height: Get.height,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Noting Found",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("you have no saved apartment"),
              SizedBox(height: 15,),
            ],
          ),
        )
            : ListView.builder(
                padding:const EdgeInsets.all(15),
                itemCount: controller.allFavorite.length,
                itemBuilder: (context, index) => 
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.APARTMENT_DETAIL,arguments: Get.find<HomeController>().allProperty.value.firstWhere((element) =>element.id==controller.allFavorite[index]["id"] ,));
                      },
                      child: Card(
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 60,
                                      height: 60,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                              .allFavorite[index]["image"]
                                              .toString(),
                                          placeholder: (context, url) =>
                                              Image.asset(
                                                  "assets/images/placeholder.png",fit: BoxFit.fill,),
                                          errorWidget: (context, url, error) =>
                                              const FaIcon(
                                                  FontAwesomeIcons.image),
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        trailing: GestureDetector(
                                          onTap: () {
                                            controller.deleteFavorite(controller.allFavorite[index]["name"]);
                                          },
                                          child: const FaIcon(
                                            FontAwesomeIcons.solidHeart,
                                            color: ColorConstant.primaryColor,
                                            size: 25,
                                          ),
                                        ),
                                        title: Text(
                                          controller.allFavorite[index]["name"]!,
                                          style: const TextStyle(fontSize: 18),
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
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller.allFavorite[index]["address"]!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${controller.allFavorite[index]["price"]} ETB",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Text(" per 1 day")
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]))),
                    ),
              )));
  }
}
