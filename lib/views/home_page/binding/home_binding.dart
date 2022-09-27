import 'package:get/get.dart';
import 'package:maakview_by_mamun/controllers/popular_controller.dart';
import 'package:maakview_by_mamun/controllers/slider_controller.dart';
import 'package:maakview_by_mamun/views/home_page/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SliderController());
    Get.put(PopularCatController());
  }

}