import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maakview_by_mamun/controllers/popular_controller.dart';
import 'package:maakview_by_mamun/controllers/slider_controller.dart';
class HomePage extends StatelessWidget {
  final sliderController = Get.find<SliderController>();
  final popularCatController = Get.find<PopularCatController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sliderController.getAllSlider();
    popularCatController.getAllPopularCategory();
    return Scaffold(
      appBar: _appBar(),
      drawer: _navigationDrawer(context),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://maakview.com/public/uploads/all/3Hjn4IXQQr2qBHNPlDIWjjphsy1i9l0K0VnUJWzp.gif',fit: BoxFit.contain,),
          Row(
            children: [
              Expanded(
                  child: _sliderOne(context),
              ),
              Expanded(
                  child: _sliderThree(context),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _sliderTwo(context),
              ),
              Expanded(
                child: _sliderFour(context),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Popular categories",textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 20)),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Obx((){
            return popularCatController.isLoading.value?
            Center(child: CircularProgressIndicator())
                :
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: popularCatController.popularCatList.length,
                itemBuilder: (context,index) {
                  return _popularCatCard(context,index);
                },),
            );
          }),
        ],
      ),
    );
  }

  _popularCatCard(BuildContext context,int index){
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
                        margin: const EdgeInsets.only(left: 8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Color(0xffd500d5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          popularCatController.popularCatList[index].name.toString(),
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
                      child: Image.network(popularCatController.popularCatList[index].banner.toString(), fit: BoxFit.contain,)
                  ),
                ),
              ],
            )));
  }

  _sliderOne(BuildContext context){
    return Obx((){
      return CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: sliderController.sliderListOne.value.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Image.network(i.img.toString(),fit: BoxFit.contain,)
              );
            },
          );
        }).toList(),
      );
    });
  }

  _sliderTwo(BuildContext context){
    return Obx((){
      return CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: sliderController.sliderListTwo.value.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Image.network(i.img.toString(),fit: BoxFit.contain,)
              );
            },
          );
        }).toList(),
      );
    });
  }

  _sliderThree(BuildContext context){
    return Obx((){
      return CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: sliderController.sliderListThree.value.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Image.network(i.img.toString(),fit: BoxFit.contain,)
              );
            },
          );
        }).toList(),
      );
    });
  }

  _sliderFour(BuildContext context){
    return Obx((){
      return CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: sliderController.sliderListFour.value.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Image.network(i.img.toString(),fit: BoxFit.contain,)
              );
            },
          );
        }).toList(),
      );
    });
  }

  _appBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.deepPurple),
      title: Image.asset("images/maakview.png"),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: (){
              Get.snackbar(
                  "No data!",
                  "No implementation found.",
                  colorText: Colors.red,
                  icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
              );
            },
            icon: Icon(Icons.search_sharp, color: Colors.deepPurple,))
      ],
    );
  }

  _navigationDrawer(BuildContext context) {
    return Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: _drawerCircleAvatar(),
                      ),
                      Row(
                        children: [
                          Text("Login"),
                          SizedBox(width: 5,),
                          Text("or"),
                          SizedBox(width: 5,),
                          Text("Registration"),
                        ],
                      ),
                    ],
                  )),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('All categories', style: TextStyle(color: Colors.deepPurple),),
                onTap: (){
                  Get.toNamed('/category_page');
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('All brands', style: TextStyle(color: Colors.deepPurple)),
                onTap: (){
                  Get.toNamed('/brand_page');
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('All shops'),
                onTap: (){
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                    colorText: Colors.red,
                    icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Offers', style: TextStyle(color: Colors.deepPurple)),
                onTap: (){
                  Get.toNamed("/offer_page");
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Track Order'),
                onTap: (){
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Dashboard'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Purches History'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Whitlist'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Followed shop'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('My Wallet'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Coupons'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              ListTile(
                leading: Image.asset("images/logo.png",height: 20,width: 20,),
                title: Text('Manage Profile'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.language,color: Colors.deepPurple,),
                trailing: Icon(Icons.chevron_right,color: Colors.deepPurple),
                title: Text('English'),
                onTap: () {
                  Get.snackbar(
                      "No data!",
                      "No implementation found.",
                      colorText: Colors.red,
                      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,)
                  );
                },
              ),
            ],
          ),
        ));
  }

  _drawerCircleAvatar() {
    return Container(
      height: 84,
      width: 84,
      padding: EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42.0),
            topRight: Radius.circular(42.0),
            bottomLeft: Radius.circular(42.0),
            bottomRight: Radius.circular(42.0),
          )),
      child: CircleAvatar(
        backgroundImage: AssetImage("images/user.png"),
      ),
    );
  }
}
