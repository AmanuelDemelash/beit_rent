import 'package:beit_rent/app/data/models/property.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class OverViewView extends GetView {
   OverViewView({super.key});
  final List<FeaturesWithImage> featuresWithImage=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Get.back(), icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
        title: const Text('OverView'),
        centerTitle: true,
      ),
      body:ListView.builder(
        padding:const EdgeInsets.all(15),
        itemCount: featuresWithImage.length,
        itemBuilder:(context, index) =>Container(
          height:250,
          margin:const EdgeInsets.only(bottom: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:CachedNetworkImage(imageUrl:featuresWithImage[index].image!.first,
              placeholder: (context, url) => Image.asset("assets/images/placeholder.png",width: 100,height: 110,),
              errorWidget: (context, url, error) =>const FaIcon(FontAwesomeIcons.image),
              fit: BoxFit.fill,
              width: Get.width
            ),),
        ) ,)
    );
  }
}
