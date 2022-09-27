import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maakview_by_mamun/views/offer_page/controller/offer_controller.dart';
class OfferPage extends StatelessWidget {
  final offerController = Get.find<OfferController>();
  OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    offerController.getAllOffer();
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx((){
            return offerController.isLoading.value?
            Center(child: CircularProgressIndicator())
                :
            Expanded(
              child: ListView.builder(
                itemCount: offerController.offerList.length,
                itemBuilder: (context,index) {
                  return Card(
                    color: Color(0xffffffff),
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: ListTile(
                      title: Text(offerController.offerList[index].title.toString()),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Container(
                            child: Image.network(offerController.offerList[index].banner.toString(),fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 5,),
                          Text(offerController.offerList[index].slug.toString()),
                          SizedBox(height: 5,),
                          Text(offerController.offerList[index].startDate.toString()),
                          SizedBox(height: 5,),
                          Text(offerController.offerList[index].endDate.toString()),
                        ],
                      ),
                    ),
                  );
                },),
            );
          }),
        ],
      ),
    );
  }

  _appBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        child: Icon(Icons.chevron_left,color: Colors.deepPurple,),
        onTap: (){
          Get.back();
        },
      ),
      title: Image.asset("images/maakview.png",),
      elevation: 0,
    );
  }
}
