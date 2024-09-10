import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../constants/colorConstant.dart';
import '../controllers/apartment_detail_controller.dart';

class ApartmentDetailView extends GetView<ApartmentDetailController> {
  const ApartmentDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Get.back(), icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
        title: const Text('Apartment Details'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              physics:const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:300,
                    width: Get.width,
                    child: Card(
                        elevation: 0.3,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: const DecorationImage(
                                        image: AssetImage("assets/images/appartment_pic.png"),
                                        fit: BoxFit.fill)),
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
                                child: ListTile(
                                  title: const Text("Luxury Addis Apartment ",style: TextStyle(fontSize: 20),),
                                  subtitle: Row(
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.locationDot,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "4kilo unity park,zewditu st,addis ababa ethiopia",
                                        maxLines: 2,
                                        style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                  titleTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "40000",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text("ETB per 1 day"),
                          ],
                        ),
                        Container(
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
                                size: 15,
                                color: ColorConstant.primaryColor,
                              ),
                              Text(
                                "Verified",
                                style: TextStyle(color: ColorConstant.primaryColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 1,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("find  charming bedroom in our apartment ",style: TextStyle(),),
                  ),
                   //overview
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Overview",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.OVERVIEW_APARTMENT),
                            child: const Text("See more",style: TextStyle(color: ColorConstant.primaryColor),))
                      ],
                    ),
                  ),
                   SizedBox(width: Get.width,
                  height: 110,
                    child: ListView.builder(
                      padding:const EdgeInsets.all(9),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin:const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/appartment_pic.png",width: 110,fit: BoxFit.fill,))),),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Facilities",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Row(children: [FaIcon(FontAwesomeIcons.bed,color: Colors.grey,),Text("3 Bed Rooms",style: TextStyle(fontSize: 15),)],),
                        SizedBox(width:25,),
                        Row(children: [FaIcon(FontAwesomeIcons.bed,color: Colors.grey,),Text("3 Bed Rooms",style: TextStyle(fontSize: 15),)],),
                      ],
                    ),
                  ),
                  //review
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                        "Rating (1 Reviewers)",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                            FontWeight.bold),
                      ),
                        Row(
                          children: [
                            Row(children:List.generate(5,(index) => const FaIcon(FontAwesomeIcons.solidStar,color: ColorConstant.primaryColor,size: 16,),),),
                            const Text("(5.0)",style: TextStyle(color: ColorConstant.primaryColor),)

                          ]
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width,
                    height: 200,
                    child: ListView.builder(
                      padding:const EdgeInsets.all(9),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                        elevation: 0.8,
                        color: Colors.white,
                        child: Container(
                          width: Get.width/2,
                            padding:const EdgeInsets.all(10),
                            margin:const EdgeInsets.only(right: 10),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const CircleAvatar(radius: 12,), Row(
                                    children: List.generate(
                                      5,(index) => const Padding(
                                        padding: EdgeInsets.all(1),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidStar,
                                          size: 10,
                                          color: ColorConstant.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],),
                                const Expanded(child: Text("thank you for your service it was awosome app",textAlign: TextAlign.start, softWrap: true,  // Enable soft wrapping
                                  overflow: TextOverflow.visible,)),
                                const Text("Aug 20,2024",textAlign: TextAlign.end,style: TextStyle(fontSize: 11),),
                        
                              ],
                            )
                        ),
                      ),),
                  ),
                ],
              ),
            ),
          )),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20)
                ),
                child:const Text("Book Now",style: TextStyle(color: Colors.white),)),
          )
        ],
      )
    );
  }
}
