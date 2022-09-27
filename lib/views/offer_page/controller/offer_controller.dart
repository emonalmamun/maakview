import 'dart:convert';

import 'package:get/get.dart';
import 'package:maakview_by_mamun/models/offer_model.dart';
import 'package:maakview_by_mamun/services/offer_service.dart';

class OfferController extends GetxController{
  final isLoading = true.obs;
  final offerList = <Offer>[].obs;

  //get all Offer
  void getAllOffer()async{
    var response = await OfferService.getOfferService();

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);
      if(response.statusCode == 200){
        isLoading.value = false;
        if(jsonResponse['data']!= null && jsonResponse['success'] == true){
          print("Success: "+jsonResponse['success'].toString());
          print("Status: "+jsonResponse['status'].toString());

          final offerModel = offerModelFromJson(response.body);

          offerList.clear();

          offerList.addAll(offerModel.data!.toList());

          print("offerList: "+offerList.length.toString());
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