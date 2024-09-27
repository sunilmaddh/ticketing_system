import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/app_constents/app_colors.dart';
import 'package:ticketing_system/app_routes/app_pages.dart';
import 'package:ticketing_system/app_routes/app_routes.dart';
import 'package:ticketing_system/controllers/ticket_home_controller.dart';
import 'package:ticketing_system/utils/navigator_service.dart';
import 'package:ticketing_system/utils/service_locator.dart';

  var navigator=locator<NavigatorService>();

void main() {
  setupLocator();
  initializeController();
  runApp(const MyApp());
}
initializeController(){
  Get.put(TicketHomeController());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticketing System',
      theme: ThemeData(
        appBarTheme:  AppBarTheme(backgroundColor:AppColors.btnBlack,
        foregroundColor: AppColors.white,
        centerTitle: true
        ),
         useMaterial3: true,
      ),
initialRoute: AppRoutes.homeId,
getPages: AppPages.pages,
    );
  }
}

