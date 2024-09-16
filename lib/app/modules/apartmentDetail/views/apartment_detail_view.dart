import 'package:beit_rent/app/data/models/property.dart';
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/colorConstant.dart';
import '../controllers/apartment_detail_controller.dart';

class ApartmentDetailView extends GetView<ApartmentDetailController> {
  ApartmentDetailView({super.key});
  final Property property = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          title: const Text('Apartment Details'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                      width: Get.width,
                      child: Card(
                          elevation: 0.3,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: property.image![0].toString(),
                                    placeholder: (context, url) => Image.asset(
                                      "assets/images/placeholder.png",
                                      fit: BoxFit.fill,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const FaIcon(FontAwesomeIcons.image),
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black,
                                          ])),
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            property.name!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              const FaIcon(
                                                FontAwesomeIcons.locationDot,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  property.absoluteLocation!
                                                      .address!,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.6)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          )),
                    ),
                    //price and verification state
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                property.price!.toString(),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              const Text("ETB per 1 day"),
                            ],
                          ),
                          property.verification!.status == "Verified"
                              ? Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: ColorConstant
                                          .primaryColor, // Border color
                                      width: 1.0, // Border width
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.certificate,
                                        size: 15,
                                        color: ColorConstant.primaryColor,
                                      ),
                                      Text(
                                        "Verified",
                                        style: TextStyle(
                                            color: ColorConstant.primaryColor),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    //description
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        property.description.toString(),
                        style: const TextStyle(),
                      ),
                    ),
                    //overview
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                              onTap: () => Get.toNamed(
                                  Routes.OVERVIEW_APARTMENT,
                                  arguments: property.image),
                              child: const Text(
                                "See more",
                                style: TextStyle(
                                    color: ColorConstant.primaryColor),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 110,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(9),
                        itemCount: property.image!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: property.image![index],
                                placeholder: (context, url) => Image.asset(
                                  "assets/images/placeholder.png",
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.fill,
                                ),
                                errorWidget: (context, url, error) =>
                                    const FaIcon(FontAwesomeIcons.image),
                                fit: BoxFit.fill,
                                width: 100,
                              ),
                            )),
                      ),
                    ),
                    //facilities
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Facilities",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.bed,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${property.bedRoom!.count} Bed Rooms",
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.bath,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${property.bathRoom!.count} Bath Rooms",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //features
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Features",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                          children: List.generate(
                        property.features!.length,
                        (index) => Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${property.features![index]} Bed Rooms",
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )),
                    ),
                    //contact
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.phone,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${property.owner!.phoneNumber}",
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    //review
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rating (${property.review!.length} Reviewers)",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            Row(
                              children: List.generate(
                                property.averageRating!.toInt(),
                                (index) => const FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color: ColorConstant.primaryColor,
                                  size: 16,
                                ),
                              ),
                            ),
                            Text(
                              "(${property.averageRating!.toPrecision(1)})",
                              style: const TextStyle(
                                  color: ColorConstant.primaryColor),
                            )
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 200,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(9),
                        itemCount: property.review!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Card(
                          elevation: 0.8,
                          color: Colors.white,
                          child: Container(
                              width: Get.width / 2,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 12,
                                      ),
                                      Row(
                                        children: List.generate(
                                          property.review![index].rating!,
                                          (index) => const Padding(
                                            padding: EdgeInsets.all(1),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 10,
                                              color: ColorConstant.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Text(
                                    property.review![index].reviewText
                                        .toString(),
                                    textAlign: TextAlign.start,
                                    softWrap: true, // Enable soft wrapping
                                    overflow: TextOverflow.visible,
                                  )),
                                  Text(
                                    DateFormat('yyyy-MM-dd')
                                        .format(
                                            property.review![index].createdAt!)
                                        .toString(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () =>
                      Get.toNamed(Routes.APARTMENT_BOOK, arguments: property),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20)),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ));
  }
}
