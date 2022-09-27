import 'package:get/get.dart';
import 'package:maakview_by_mamun/views/brand_page/controller/brand_controller.dart';

class BrandBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BrandController());
  }

}