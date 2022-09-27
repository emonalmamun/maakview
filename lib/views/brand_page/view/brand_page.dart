import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maakview_by_mamun/views/brand_page/controller/brand_controller.dart';
class BrandPage extends StatelessWidget {
  final brandController = Get.find<BrandController>();
  BrandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    brandController.getAllBrand();
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx((){
            return brandController.isLoading.value?
            Center(child: CircularProgressIndicator())
                :
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: brandController.brandList.length,
                itemBuilder: (context,index) {
                  return _productCard(context,index);
                },),
            );
          }),
        ],
      ),
    );
  }

  _productCard(BuildContext context,int index){
    return InkWell(
        onTap: null,
        child: Container(
            margin:EdgeInsets.all(10),
            height: 200,
            width: MediaQuery.of(context).size.width / 2 - 29,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffffffff).withOpacity(0.46)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment(1, 0.5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 8.0,bottom: 5),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Color(0xffd500d5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          brandController.brandList[index].slug.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width / 2 - 64,
                      height: MediaQuery.of(context).size.width / 2 - 64,
                      child: Image.network(brandController.brandList[index].logo.toString(),fit: BoxFit.contain,)
                  ),
                ),

              ],
            )));
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
      title: Image.asset("images/maakview.png"),
      elevation: 0,
    );
  }
}
