import 'dart:convert';

import 'package:get/get.dart';
import 'package:maakview_by_mamun/models/brand_model.dart';
import 'package:maakview_by_mamun/services/brand_service.dart';

class BrandController extends GetxController{
  final isLoading = true.obs;
  final brandList = <Brand>[].obs;

  //get all pharmacy
  void getAllBrand()async{
    var response = await BrandService.getBrandService();

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);
      if(response.statusCode == 200){
        isLoading.value = false;
        if(jsonResponse['data']!= null && jsonResponse['success'] == true){
          print("Success: "+jsonResponse['success'].toString());
          print("Status: "+jsonResponse['status'].toString());
          //print("jsonResponse: "+jsonResponse['data'][1]['data'][0]['name'].toString());

          final brandModel = brandModelFromJson(response.body);

          brandList.clear();

          brandList.addAll(brandModel.data!.toList());

          print("brandList: "+brandList.length.toString());
        }else{
          isLoading.value = false;
          print("Success: "+jsonResponse['success'].toString());
        }

      }else{
        isLoading.value = false;
        print("Success: "+jsonResponse['success'].toString());
      }

    }on Exception catch(e){
      isLoading.value = false;
      print(e.toString());
    }
  }
}