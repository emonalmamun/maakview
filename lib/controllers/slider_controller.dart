import 'dart:convert';

import 'package:get/get.dart';
import 'package:maakview_by_mamun/services/slider_service.dart';

import '../models/slider_model.dart';

class SliderController extends GetxController{
  final isLoading = true.obs;
  final sliderListOne = <Four>[].obs;
  final sliderListTwo = <Four>[].obs;
  final sliderListThree = <Four>[].obs;
  final sliderListFour = <Four>[].obs;

  //get all Slider
  void getAllSlider()async{
    var response = await SliderService.getSliderService();

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);
      if(response.statusCode == 200){
        isLoading.value = false;
        if(jsonResponse['data']!= null && jsonResponse['success'] == true){
          print("Success: "+jsonResponse['success'].toString());
          print("Status: "+jsonResponse['status'].toString());

          final sliderModel = sliderModelFromJson(response.body);

          sliderListOne.clear();
          sliderListOne.addAll(sliderModel.data!.one!.toList());


          sliderListTwo.clear();
          sliderListTwo.addAll(sliderModel.data!.two!.toList());

          sliderListThree.clear();
          sliderListThree.addAll(sliderModel.data!.three!.toList());

          sliderListFour.clear();
          sliderListFour.addAll(sliderModel.data!.four!.toList());

          print("sliderListOne: "+sliderListOne.length.toString());
          print("sliderListTwo: "+sliderListTwo.length.toString());
          print("sliderListThree: "+sliderListThree.length.toString());
          print("sliderListFour: "+sliderListFour.length.toString());
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