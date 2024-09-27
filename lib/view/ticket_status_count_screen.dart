import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/controllers/ticket_home_controller.dart';

class TicketStatusCountScreen extends StatelessWidget {
   TicketStatusCountScreen({super.key});
  final _ticketController=Get.find<TicketHomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Ticket count"),),body: ListView.builder(
      shrinkWrap: true,
      itemCount: _ticketController.countMap.length,
      itemBuilder: (context, index){
return ListTile(title: Text(_ticketController.countMap[index]),);

    }),);
    
    
     
  }
}