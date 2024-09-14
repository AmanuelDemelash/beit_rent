import 'package:beit_rent/app/constants/colorConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/property.dart';
import '../../../data/models/customer_mode;.dart';
import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<List<Property>> allProperty = RxList<Property>().obs;
  Rx<List<Property>> searchedProperty = RxList<Property>().obs;

  RxBool isSearch=false.obs;

  RxInt bottomNavIndex = 0.obs;
  RxInt carouselIndex = 0.obs;
  RxBool viewModeList = false.obs;
  RxBool isLoadingAllProperty = false.obs;
  Rx<Customer> customer = Customer().obs;

  late Box _boxFavorite;
  RxList<dynamic> allFavorite=RxList<dynamic>();

  //filte
  Rx<RangeValues> rangeValues = RangeValues(500, 20000).obs;
  RxInt bedRoomCount=0.obs;
  RxInt bathRoomCount=0.obs;

  @override
  void onInit() {
    super.onInit();
    getCustomer();
    getAllProperty();
    _boxFavorite=Hive.box('favorite');
  }

  Future<void> getAllProperty() async {
    isLoadingAllProperty.value = true;
    try {
      var result = await _apiProvider.getAllProperty();
      if (result!.statusCode == 200) {
        allProperty.value.addAll(propertyFromJson(result.bodyString!).toList());
        isLoadingAllProperty.value = false;
      } else {
        isLoadingAllProperty.value = false;
      }
    } catch (e) {
      isLoadingAllProperty.value = false;
      Get.rawSnackbar(
          message: "something went wrong", backgroundColor: Colors.redAccent);
    }
  }

  Future<void> getCustomer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id') ?? "";
    if (id.isNotEmpty) {
      var result = await _apiProvider.getCustomer(id);
      if (result!.statusCode == 200) {
        customer.value = customerFromJson(result.bodyString!);
      } else {}
    }
  }

  Future<void> searchProperty(String name) async {
    if (allProperty.value.isNotEmpty) {
      searchedProperty.value.clear();
      searchedProperty.value.addAll(allProperty.value
          .where(
            (element) => element.name!.contains(name),
          )
          .toList());
    }
  }

  Future<void> addFavorite(Property property)async{
    _boxFavorite.put(property.name!,{"id":property.id,"image":property.image![0],"name":property.name,"address":property.absoluteLocation!.address,"price":property.price});
    Get.rawSnackbar(message: "Successfully added to saved!",backgroundColor: ColorConstant.primaryColor);
  }
  Future<void> deleteFavorite(Property property)async{
    _boxFavorite.delete(property.name!);
    Get.rawSnackbar(message: "Removed from saved!",backgroundColor: ColorConstant.primaryColor);
  }
  bool checkFavorite(String name){
    return _boxFavorite.containsKey(name);
  }
  Future<void> getFavorites()async{
    allFavorite.clear();
    var favorites= _boxFavorite.values.toList();
    allFavorite.addAll(favorites.toList());
  }
  Future<void> clearFavorites()async{
    _boxFavorite.clear();
    allFavorite.clear();
  }

}
