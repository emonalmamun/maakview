import 'dart:convert';

import 'package:get/get.dart';
import 'package:maakview_by_mamun/models/popular_model.dart';
import 'package:maakview_by_mamun/services/popular_service.dart';

class PopularCatController extends GetxController{
  final isLoading = true.obs;
  final popularCatList = <PopularCat>[].obs;

  //get all Offer
  void getAllPopularCategory()async{
    var response = await PopularCatService.getPopularCatService();

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);
      if(response.statusCode == 200){
        isLoading.value = false;
        if(jsonResponse['data']!= null && jsonResponse['success'] == true){
          print("Success: "+jsonResponse['success'].toString());
          print("Status: "+jsonResponse['status'].toString());

          final popularCatModel = popularModelFromJson(response.body);

          popularCatList.clear();

          popularCatList.addAll(popularCatModel.data!.data!.toList());

          print("popularCatList: "+popularCatList.length.toString());
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