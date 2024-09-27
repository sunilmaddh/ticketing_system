import 'package:flutter/material.dart';
import 'package:ticketing_system/app_constents/app_colors.dart';

class TicketListTIle extends StatelessWidget {
   const TicketListTIle({super.key, required this.name, required this.date, required this.status, required this.onTap, required this.statusController,});
  final String name;
  final String date;
  final String status;
  final VoidCallback onTap;
  final TextEditingController statusController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.btnBlack,width: 0.5),
          borderRadius: BorderRadius.circular(20)
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ Text(name,style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      const Text("Due date", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
            Text(date, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
          ],
        ),
        SizedBox(
         height:32,
         width: 90,
          child: TextFormField(
            initialValue: status,
            decoration:const InputDecoration(
       
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
          )),

          IconButton(onPressed: (){}, icon: const Icon(Icons.menu_book_sharp))
      
      ],) ,);
  }
}


