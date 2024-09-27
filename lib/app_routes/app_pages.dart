import 'package:get/get.dart';
import 'package:ticketing_system/app_routes/app_routes.dart';
import 'package:ticketing_system/test.dart';
import 'package:ticketing_system/view/ticket_form.dart';
import 'package:ticketing_system/view/home_page.dart';
import 'package:ticketing_system/view/ticket_status_count_screen.dart';

class AppPages{

  static  List<GetPage> pages=[
       GetPage(name: AppRoutes.homeId, page:()=>  HomePage()),
       GetPage(name: AppRoutes.createTicketId, page:()=>  const TicketForm()),
       GetPage(name: AppRoutes.createTicketId, page:()=>  MyWidget()),
       GetPage(name: AppRoutes.ticketStatusCountScreen, page:()=>  TicketStatusCountScreen()),




    
  ];
}