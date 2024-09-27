import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/app_constents/app_colors.dart';
import 'package:ticketing_system/app_routes/app_routes.dart';
import 'package:ticketing_system/components/custom_drop_down_menu.dart';
import 'package:ticketing_system/components/ticket_list_tile.dart';
import 'package:ticketing_system/controllers/ticket_home_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final _ticketHomeController =Get.find<TicketHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Home"),),
    floatingActionButton:FloatingActionButton(
          onPressed: () {
                 _ticketHomeController.clearData();
                 Get.toNamed(AppRoutes.createTicketId);
          },
          backgroundColor: AppColors.btnBlack,
          isExtended: true,
          child:  Text(
            textAlign: TextAlign.center,
            style: TextStyle(color:AppColors.white ),
            "Add Ticket"),
        ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CustomDropDownMenu(statusList: _ticketHomeController.stutasList,ticketHomeController: _ticketHomeController,),ElevatedButton(onPressed: (){
               
               _ticketHomeController.filterStatusCount();
               Get.toNamed(AppRoutes.ticketStatusCountScreen);
                }, child: const Text("Ticket count"))],),
              const SizedBox(height: 20,),
          Obx(()=>_ticketHomeController.filterListModel.isNotEmpty?ListViewFilter(ticketHomeController: _ticketHomeController):
              ListViewWidget(ticketHomeController: _ticketHomeController))
            ],
          ),
        ),
      ),
    ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.ticketHomeController});
  final TicketHomeController ticketHomeController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ticketHomeController.ticketListModel.length,
      itemBuilder: (context, index){
        var data=ticketHomeController.ticketListModel[index];
    
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TicketListTIle(name: data.name, date: data.dueDate, status: data.status, onTap: (){}, statusController: ticketHomeController.statusController),
      );
    });
  }
}
class ListViewFilter extends StatelessWidget {
  const ListViewFilter({super.key, required this.ticketHomeController});
  final TicketHomeController ticketHomeController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ticketHomeController.filterListModel.length,
      itemBuilder: (context, index){
        print(ticketHomeController.ticketListModel);
        var data=ticketHomeController.filterListModel[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TicketListTIle(name: data.name, date: data.dueDate, status: data.status, onTap: (){}, statusController: ticketHomeController.statusController),
      );
    });
  }
}