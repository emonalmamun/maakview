import 'package:http/http.dart' as http;

import '../utils/constant.dart';
class PopularCatService{
  static Future<http.Response> getPopularCatService()async{
    var response = await http.get(Uri.parse('${Constant.apiBaseUrl}/api/v1/setting/home/popular_categories'),
    );
    //print(response.body);
    return response;
  }
}