import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/app_constents/app_colors.dart';
import 'package:ticketing_system/controllers/ticket_home_controller.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.statusList,
    required this.ticketHomeController,
  });

  final List<String> statusList;
  final TicketHomeController ticketHomeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.lightGrey
      ),
      child: Obx(
        () {
          return DropdownButton<String>(
            value: ticketHomeController.selectedvalue.value.isEmpty
                ? null
                : ticketHomeController.selectedvalue.value,
            items: statusList.map((String value) {
              return DropdownMenuItem<String>(
                value: value, // Corrected here to use the actual item value
                child: Text(value),
              );
            }).toList(),
           
            onChanged: (String? newValue) async{
              if (newValue != null) {
                 ticketHomeController.selectedvalue.value = newValue;
                 ticketHomeController.filterListModel.clear();
                 await  ticketHomeController.filter(newValue);
              }
            },
            isExpanded: true,
            underline: Container(), // Hides the underline if needed
            style:  TextStyle(color: AppColors.btnBlack, fontSize: 16),
          );
        },
      ),
    );
  }
}
