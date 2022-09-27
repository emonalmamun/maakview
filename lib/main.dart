import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_by_mamun/views/brand_page/binding/brand_binding.dart';
import 'package:maakview_by_mamun/views/brand_page/view/brand_page.dart';
import 'package:maakview_by_mamun/views/category_page/binding/category_binding.dart';
import 'package:maakview_by_mamun/views/category_page/view/category_page.dart';
import 'package:maakview_by_mamun/views/home_page/binding/home_binding.dart';
import 'package:maakview_by_mamun/views/home_page/view/home_page.dart';
import 'package:maakview_by_mamun/views/offer_page/binding/offer_binding.dart';
import 'package:maakview_by_mamun/views/offer_page/view/offer_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Developed by emonalmamun@gmail.com',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> HomePage(), binding: HomeBinding()),
        GetPage(name: "/category_page", page: ()=> CategoryPage(), binding: CategoryBinding()),
        GetPage(name: "/brand_page", page: ()=> BrandPage(), binding: BrandBinding()),
        GetPage(name: "/offer_page", page: ()=> OfferPage(), binding: OfferBinding()),
      ],
    );
  }
}

