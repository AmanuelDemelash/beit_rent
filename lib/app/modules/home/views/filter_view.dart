import 'package:beit_rent/app/constants/colorConstant.dart';
import 'package:beit_rent/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FilterView extends GetView<HomeController> {
  const FilterView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          title: const Text('Filter'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                ExpansionTile(
                  title: Row(
                    children: [
                      Checkbox.adaptive(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text(
                        "Location",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  childrenPadding: const EdgeInsets.all(15),
                  children: const [
                    Text(
                        "Type of location from where you want to calculate teh distance"),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: [
                      Obx(() => Checkbox.adaptive(
                        value:controller.rangeValues.value.end<20000,
                        onChanged: (value) {},
                      ),),
                      const Text(
                        "Price Range",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  childrenPadding: const EdgeInsets.all(15),
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${controller.rangeValues.value.start}ETB/day"),
                          Text("${controller.rangeValues.value.end}ETB/day")
                        ],
                      ),
                    ),
                    Obx(() => RangeSlider(
                          values: controller.rangeValues.value,
                          labels: RangeLabels(
                              "${controller.rangeValues.value.start}",
                              "${controller.rangeValues.value.end}"),
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          min: 500,
                          max: 20000,
                          divisions: 500,
                          onChanged: (value) {
                            controller.rangeValues.value = value;
                          },
                        ))
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: [
                     Obx(() => Checkbox.adaptive(
                        value:controller.bedRoomCount.value>0,
                        onChanged: (value) {},
                      ),),
                      const Text(
                        "BedRoom",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  childrenPadding: const EdgeInsets.all(15),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Count",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if(controller.bedRoomCount.value!=0){
                                  controller.bedRoomCount.value--;
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Obx(() =>Container(
                              width: 40,
                              height: 40,
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text(controller.bedRoomCount.value.toString())),
                            ),),
                            GestureDetector(
                              onTap: () => controller.bedRoomCount.value++,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: [
                      Obx(() =>Checkbox.adaptive(
                        value:controller.bathRoomCount.value>0,
                        onChanged: (value) {},
                      ),),
                      const Text(
                        "BathRoom",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  childrenPadding: const EdgeInsets.all(15),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Count",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if(controller.bathRoomCount.value!=0){
                                  controller.bathRoomCount.value--;
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                           Obx(() => Container(
                              width: 40,
                              height: 40,
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text(controller.bathRoomCount.value.toString())),
                            ),),
                            GestureDetector(
                              onTap: () => controller.bathRoomCount.value++,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            )),
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          controller.rangeValues.value=RangeValues(500, 20000);
                          controller.bedRoomCount.value=0;
                          controller.bathRoomCount.value=0;
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                color: ColorConstant.primaryColor)),
                        child: const Text(
                          "Reset",
                          style: TextStyle(color: ColorConstant.primaryColor),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text(
                          "Apply",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
