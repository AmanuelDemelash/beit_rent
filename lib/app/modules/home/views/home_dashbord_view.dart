import 'package:beit_rent/app/constants/colorConstant.dart';
import 'package:beit_rent/app/controllers/global_controller.dart';
import 'package:beit_rent/app/data/models/property.dart';
import 'package:beit_rent/app/modules/home/controllers/home_controller.dart';
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/appBarTitle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeDashBordView extends GetView<HomeController> {
  HomeDashBordView({super.key});
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(),
          actions: [
           Get.find<GlobalController>().isLogIn.value?Row(
             children: [
               ElevatedButton(
                   onPressed: (){},
                   child: const Text(
                     "Become a Host",
                     style: TextStyle(color: Colors.white),
                   )),
               const SizedBox(width:10,),
               GestureDetector(
                 onTap: () => Get.toNamed(Routes.NOTIFICATION),
                   child: const FaIcon(FontAwesomeIcons.solidBell))
             ],
           )
           :ElevatedButton(
                onPressed: () => Get.toNamed(Routes.AUTH),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GetBuilder(
                init: controller,
                builder:(controller) {
                  final customer = controller.customer.value.customer;
                  return Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Hi, ${customer?.firstName ?? ""} ',
                        style: const TextStyle(fontSize: 17)),
                    const TextSpan(
                        text: '\nDiscover your dream house',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                  ]));
                },),
              // search section
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchTextController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Padding(
                              padding: EdgeInsets.all(10),
                              child: FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.grey,
                              )),
                          hintText: "Search",
                          hintStyle: const TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black))),
                    )),
                    Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.only(right:6, left:6),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(9)),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.filter,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.viewModeList.value =
                          !controller.viewModeList.value,
                      child: Container(
                        width:45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(9)),
                        child: Obx(
                          () => Center(
                              child: controller.viewModeList.value
                                  ? Image.asset(
                                      "assets/images/list_view.png",
                                      width: 24,
                                      height: 24,
                                    )
                                  : Image.asset(
                                      "assets/images/card_view.png",
                                      width: 20,
                                      height: 20,
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // apartment list
              Expanded(
                  child: Obx(() =>controller.isLoadingAllProperty.value? Center(
                    child:LoadingAnimationWidget.fourRotatingDots(
                      color: ColorConstant.primaryColor,
                      size:40,
                    ),
                  ):controller.allProperty.value.isEmpty? Column(
                    children: [
                      ElevatedButton(onPressed: () {}, child:const Text("data"))
                    ],
                  ):
                  !controller.viewModeList.value
                      ? SizedBox(
                          width: Get.width,
                          height: Get.height,
                          child:
                          RefreshIndicator(
                            onRefresh: () => controller.getAllProperty(),
                            color: ColorConstant.primaryColor,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //horizontal list
                                  SizedBox(
                                    height: 260,
                                    width: Get.width,
                                    child: ListView.builder(
                                        itemCount: controller.allProperty.value.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                             GestureDetector(
                                               onTap: () => Get.toNamed(Routes.APARTMENT_DETAIL,arguments: controller.allProperty.value[index]),
                                                 child: ApartmentHorizontalCard(property:controller.allProperty.value[index]))),
                                  ),
                                  //vertical list
                                  const Padding(
                                    padding: EdgeInsets.only(top: 14, bottom: 14),
                                    child: Text(
                                      "Season Top",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:controller.allProperty.value.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                          onTap: () => Get.toNamed(Routes.APARTMENT_DETAIL,arguments: controller.allProperty.value[index]),
                                            child: ApartmentVerticalCard(property: controller.allProperty.value[index],)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:controller.allProperty.value.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Get.toNamed(Routes.APARTMENT_DETAIL,arguments: controller.allProperty.value[index]),
                            child: ApartmentListView(property: controller.allProperty.value[index],),
                          ),
                        )))
            ],
          ),
        ));
  }
}

class ApartmentListView extends StatelessWidget {
  const ApartmentListView({
    super.key,
    required this.property
  });
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.white,
        child: Column(
          children: [
             Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:CarouselSlider.builder(
                      carouselController: CarouselSliderController(),
                      itemCount:property.image!.length,
                      itemBuilder:(context, index, realIndex) => CachedNetworkImage(imageUrl:property.image![index].toString(),
                        placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                        errorWidget: (context, url, error) =>const FaIcon(FontAwesomeIcons.image),
                        fit: BoxFit.cover,width: Get.width,
                        height: 300,
                      ),
                      options: CarouselOptions(
                        aspectRatio: 16/9,
                        viewportFraction:1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) =>Get.find<HomeController>().carouselIndex.value=index,
                      )
                  )
              ),
              Positioned(
                bottom:20,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: Get.width,
                    child: Center(
                      child:Obx(() => CarouselIndicator(
                            count:property.image!.length,
                             color: Colors.black.withOpacity(0.5),
                            width: 10,
                            height: 10,
                           activeColor: Colors.white,
                            index: Get.find<HomeController>().carouselIndex.value,
                          ),)
                    ),
                  ),
                  )
            ],),
             ListTile(
              title: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      property.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(children: [
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: ColorConstant.primaryColor,
                      size: 16,
                    ),
                    Text("${property.averageRating!.toPrecision(1)}"),
                    Text("(${property.review!.length})")
                  ])
                ],
              ),
              subtitle: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(property.description!,maxLines: 1,),
                  const SizedBox(
                    height: 8,
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
                          property.absoluteLocation!.address!,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: const TextStyle(
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        property.price.toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight:
                                FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      const Text("ETB per 1 day")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class ApartmentVerticalCard extends StatelessWidget {
  const ApartmentVerticalCard({
    super.key,
    required this.property
  });
  final Property property;
  @override
  Widget build(BuildContext context) {
    return
      Card(
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
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 90,
                  height: 90,
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:CachedNetworkImage(imageUrl:property.image![0].toString(),
                      placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                      errorWidget: (context, url, error) =>const FaIcon(FontAwesomeIcons.image),
                      fit: BoxFit.cover,width:90,height: 90,
                    ),
                  ),
                ),
                 Expanded(
                  child: ListTile(
                    trailing:const FaIcon(
                      FontAwesomeIcons.heart,
                      color: ColorConstant.primaryColor,
                    ),
                    title: Text(
                      property.name!,
                      style:const TextStyle(fontSize:18),
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
                            const SizedBox(width: 3,),
                            Expanded(
                              child: Text(
                                property.absoluteLocation!.address!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(
                              "${property.price} ETB",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Text(" per 1 day")
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.bed,size: 17,
                              color: Colors.grey,
                            ),
                            const SizedBox(width:3,),
                            Text("${property.bedRoom!.count} Bed Room")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        property.averageRating!.toInt(),
                        (index) => const Padding(
                          padding: EdgeInsets.all(1),
                          child: FaIcon(
                            FontAwesomeIcons.solidStar,
                            size: 15,
                            color: ColorConstant.primaryColor,
                          ),
                        ),
                      ),
                    ),
                     Text(
                      "(${property.averageRating!.toPrecision(1)})",
                      style:const TextStyle(
                          color: ColorConstant.primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text("${property.review!.length} Reviews"),
                property.verification!.status=="Verified"?Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ColorConstant.primaryColor, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.certificate,
                        size: 14,
                        color: ColorConstant.primaryColor,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Verified",
                        style: TextStyle(color: ColorConstant.primaryColor),
                      )
                    ],
                  ),
                ):const SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ApartmentHorizontalCard extends StatelessWidget {
   const ApartmentHorizontalCard({
    super.key,
    required this.property
  });
 final Property property;
  @override
  Widget build(BuildContext context) {
    return
      Card(
        elevation: 0.2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(imageUrl:property.image![0].toString(),
                  placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                  errorWidget: (context, url, error) =>const FaIcon(FontAwesomeIcons.image),
                    fit: BoxFit.cover,width: Get.width - 60,
                  ),
              ),
              Container(
                width: Get.width - 60,
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
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(property.name!,style:const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),),
                      const SizedBox(height:6,),
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
                            child: Text(property.absoluteLocation!.address!,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.start,
                              softWrap: true,
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

              )
            ],
          ),
        ));
  }
}
