import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maakview_by_mamun/utils/constant.dart';
import '../controller/category_controller.dart';
class CategoryPage extends StatelessWidget {
  final categoryController = Get.find<CategoryController>();
  CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    categoryController.getAllCategory();
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("All categories",textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 20)),
              ),
            ],
          ),
          Obx((){
            return categoryController.isLoading.value?
                Center(child: CircularProgressIndicator())
                :
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemCount: categoryController.categoryList.length,
                itemBuilder: (context,index) {
                  return _productCard(context,index);
                },
              ),
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
      title: Image.asset("images/maakview.png"),
      elevation: 0,
    );
  }

  // _card(){
  //   return Card(
  //     color: Colors.white,
  //     margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
  //     child: ListTile(
  //       title: Text(categoryController.categoryList[index].name.toString()),
  //       subtitle: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Image.network(categoryController.categoryList[index].banner.toString(),fit: BoxFit.cover,),
  //             height: 200,
  //           ),
  //           Text(categoryController.categoryList[index].slug.toString()),
  //         ],
  //       ),
  //     ),
  //   )
  // }

  _productCard(BuildContext context,int index){
    return InkWell(
        onTap: null,
        child: Container(
          margin:EdgeInsets.all(10),
            height: 200,
            width: MediaQuery.of(context).size.width / 2 - 29,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffffffff)),
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
                          categoryController.categoryList[index].name.toString(),
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
                    //padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 2 - 64,
                    height: MediaQuery.of(context).size.width / 2 - 64,
                    child: Image.network(categoryController.categoryList[index].banner.toString(), fit: BoxFit.contain,)
                  ),
                ),

              ],
            )));
  }
}
