import 'package:beit_rent/app/constants/colorConstant.dart';
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/appBarTitle.dart';
import '../widgets/headerTextSpan.dart';

class HomeDashBordView extends GetView {
  HomeDashBordView({super.key});

  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(),
          actions: [
            ElevatedButton(
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
              const HeaderTextSpan(),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black))),
                    )),
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(9)),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.filter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                          child: Image.asset(
                        "assets/images/card_view.png",
                        width: 30,
                        height: 30,
                      )),
                    ),
                  ],
                ),
              ),
              // apartment list
           Expanded(child: SizedBox(
            width: Get.width,
            height: Get.height,
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
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Card(
                              elevation: 0.5,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: Get.width - 60,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/appartment_pic.png"),
                                              fit: BoxFit.fill)),
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
                                      child: ListTile(
                                        title: const Text("Apartment name"),
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
                                              "4kilo unity park,zewditu st,addis ababa ethiopia",maxLines: 2,
                                              style: TextStyle(
                                                  color:
                                                  Colors.white.withOpacity(0.6)),
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
                              ))),
                    ),
                    //vertical list
                    const Padding(
                      padding:EdgeInsets.only(top: 14,bottom: 14),
                      child:Text("Season Top", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (context, index) => Card(
                        color: Colors.white,
                        elevation: 0.7,
                        child: Container(
                          width: Get.width,
                          padding:const EdgeInsets.all(4),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading:Image.asset("assets/images/appartment_pic.png",
                                  width: 90,height:90,
                                  fit: BoxFit.fill,) ,
                                trailing:const FaIcon(FontAwesomeIcons.heart,color: ColorConstant.primaryColor,),
                                title: const Text("Luxury addis apartment",style: TextStyle(fontSize: 21),),
                                subtitle: const Column(
                                  children: [
                                    Row(children: [FaIcon(FontAwesomeIcons.locationDot,size: 15,color: Colors.grey,),Text("Meskel flower, addis ababa",style: TextStyle(color: Colors.grey),)],),
                                    Row(
                                      children: [
                                        Text("4000 ETB",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                        Text("per 1 day")
                                      ],
                                    ),
                                    Row(children: [FaIcon(FontAwesomeIcons.bed,color: Colors.grey,),Text("1 Bed Room")],)
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                   Row(
                                     children: [
                                       Row(children:List.generate(5,(index) =>const Padding(
                                         padding: EdgeInsets.all(1),
                                         child: FaIcon(FontAwesomeIcons.solidStar,size: 15,color: ColorConstant.primaryColor,),
                                       ) ,),),
                                      const Text("(5.0)",style: TextStyle(color: ColorConstant.primaryColor,fontWeight: FontWeight.bold),)
                                     ],
                                   ),
                                  const Text("1 Reviews"),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: ColorConstant.primaryColor,  // Border color
                                        width: 1.0,         // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(children: [
                                    FaIcon(FontAwesomeIcons.certificate,size: 15,color: ColorConstant.primaryColor,),
                                    Text("Verified",style: TextStyle(color: ColorConstant.primaryColor),)
                                  ],),)
                                ],
                              )
 
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),),
          )
          )

            ],
          ),
        ));
  }
}
