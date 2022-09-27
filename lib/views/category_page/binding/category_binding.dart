import 'package:get/get.dart';
import 'package:maakview_by_mamun/views/category_page/controller/category_controller.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CategoryController());
  }

}