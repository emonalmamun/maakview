import 'package:get/get.dart';
import 'package:maakview_by_mamun/views/offer_page/controller/offer_controller.dart';

class OfferBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OfferController());
  }

}