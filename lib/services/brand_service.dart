import 'package:http/http.dart' as http;

import '../utils/constant.dart';
class BrandService{
  static Future<http.Response> getBrandService()async{
    var response = await http.get(Uri.parse('${Constant.apiBaseUrl}/api/v1/all-brands'),
    );
    //print(response.body);
    return response;
  }
}