import 'package:http/http.dart' as http;

import '../utils/constant.dart';
class OfferService{
  static Future<http.Response> getOfferService()async{
    var response = await http.get(Uri.parse('${Constant.apiBaseUrl}/api/v1/all-offers'),
    );
    //print(response.body);
    return response;
  }
}