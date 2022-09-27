import 'dart:convert';

import 'package:get/get.dart';
import 'package:maakview_by_mamun/services/category_service.dart';

import '../../../models/category_model.dart';

class CategoryController extends GetxController{
  final isLoading = true.obs;
  final categoryList = <Data>[].obs;

  //get all pharmacy
  void getAllCategory()async{
    var response = await CategoryService.getCategoryService();

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);
      if(response.statusCode == 200){
        isLoading.value = false;
        if(jsonResponse['data']!= null && jsonResponse['success'] == true){
          print("Success: "+jsonResponse['success'].toString());
          print("Status: "+jsonResponse['status'].toString());
          //print("jsonResponse: "+jsonResponse['data'][1]['data'][0]['name'].toString());

          final categoryModel = categoryModelFromJson(response.body);

          categoryList.clear();

          categoryList.addAll(categoryModel.data!.toList());

          print("categoryList: "+categoryList.length.toString());
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