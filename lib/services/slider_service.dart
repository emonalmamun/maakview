import 'package:http/http.dart' as http;

import '../utils/constant.dart';
class SliderService{
  static Future<http.Response> getSliderService()async{
    var response = await http.get(Uri.parse('${Constant.apiBaseUrl}/api/v1/setting/home/sliders'),
    );
    //print(response.body);
    return response;
  }
}