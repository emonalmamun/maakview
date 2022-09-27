import 'package:http/http.dart' as http;

import '../utils/constant.dart';
class CategoryService{
  static Future<http.Response> getCategoryService()async{
    var response = await http.get(Uri.parse('${Constant.apiBaseUrl}/api/v1/all-categories'),
    );
    //print(response.body);
    return response;
  }
}