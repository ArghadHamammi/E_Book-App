import 'package:e_book/Binding/initialBinding.dart';
import 'package:e_book/core/constant/routes.dart';
import 'package:e_book/core/localization/changelocal.dart';
import 'package:e_book/core/localization/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: "E_Book",
      locale: controller.language,
      theme: controller.apptheme,
      initialBinding: InitialBindings(),
      //   home:const  Language(),
      //  routes: routes,
      getPages: routes,
    );
  }
}
