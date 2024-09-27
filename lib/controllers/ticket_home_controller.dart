import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/model/ticket_model.dart';
import 'package:ticketing_system/services/ticket_service.dart';
import 'package:ticketing_system/utils/toast_utils.dart';

class TicketHomeController extends GetxController{
  RxString selectedvalue='All Ticket'.obs;
  List<String> stutasList=['All Ticket','closed', 'open', 'on hold'];
  RxString selectedDate=''.obs;
  RxString selectedImage=''.obs;
  RxString totalCount="".obs;
  RxList<TicketListModel> ticketListModel=<TicketListModel>[].obs;
  RxList<TicketListModel> filterListModel=<TicketListModel>[].obs;
  RxList<TicketListModel> tempListModel=<TicketListModel>[].obs;
  final TextEditingController statusController=TextEditingController(),
     nameController=TextEditingController(),
     contactController=TextEditingController(),
     emailController=TextEditingController(),
     subjectController=TextEditingController(),
     descriptionController=TextEditingController(),
     ticketOwnerController=TextEditingController(),
     accountNameController=TextEditingController(),
     dueDateController=TextEditingController();
     RxList<String> countMap = <String>[].obs;
   @override
  void onInit() {
    super.onInit();
    loadServices();

  }
  void loadServices() {
    List<Map<String, dynamic>> menuItems = [
          {"name": 'Ticket1', "due_date": '16-09-2024','status':"closed"},
          {"name": 'Ticket2', "due_date": '16-09-2024','status':"open"},
          {"name": 'Ticket3', "due_date": '16-09-2024','status':"closed"},
          {"name": 'Ticket4', "due_date": '16-09-2024','status':"on hold"},
          {"name": 'Ticket5', "due_date": '16-09-2024','status':"open"},
          {"name": 'Ticket6', "due_date": '16-09-2024','status':"on hold"},
          {"name": 'Ticket7', "due_date": '16-09-2024','status':"closed"},
          {"name": 'Ticket8', "due_date": '16-09-2024','status':"open"},
          {"name": 'Ticket8', "due_date": '16-09-2024','status':"open"},
    
    ];
   ticketListModel .value = menuItems.map((item) => TicketListModel.fromMap(item)).toList();
  }
  Future<void> filter(String value)async{ 
    if(value.isNotEmpty && value!="All Ticket") {
      filterListModel.clear();
     ToastUtils.instance.showToast(message: filterListModel.toString()); 
       for(int i=0;i<=ticketListModel.length;i++){
         if (ticketListModel[i].status == value) { 
           filterListModel.add(ticketListModel[i]);  
           ToastUtils.instance.showToast(message: filterListModel[i].status); 
      }
    }
    }  else{
      filterListModel.clear();
    }
  }

  void filterStatusCount() async {
  List<TicketListModel> tempListModel = [];
  tempListModel.addAll(ticketListModel);
   countMap.clear();
   totalCount.value="Total number of ticket ${ticketListModel.length}"  ;
   countMap.add(totalCount.value);
  for (int i = 0; i < tempListModel.length; i++) {
    String totalCount="";
    int count = 0;
    for (int j = 0; j < tempListModel.length; j++) {
      if (tempListModel[i].status==tempListModel[j].status) { count++;
      totalCount  ="Total number of ticket ${tempListModel[i].status} $count" ;
        if(count>1){
          tempListModel.removeAt(j);
        }
        
      }
    }
    countMap.add(totalCount);
  }
}
 final _ticketServices=TicketService();
Future<void> fetchTicket()async{
   Map<String, dynamic> responseData=await _ticketServices.fetchTicketList();
   int statuscode=responseData["responseCode"];
   if(statuscode==200){
    var data=responseData['responseBody'];
   }else{
    ToastUtils.instance.showToast(message: "Something went wrong");
   }
}

Future<void> createTicket()async{
  var data={};
   Map<String, dynamic> responseData=await
   _ticketServices.createTicket(data: data);
   int statuscode=responseData["responseCode"];
   if(statuscode==200){
    var data=responseData['responseBody'];
   }else{
    ToastUtils.instance.showToast(message: "Something went wrong");
   }
}

clearData(){
  nameController.clear();
  contactController.clear();
  emailController.clear();
  subjectController.clear();
  accountNameController.clear();
  descriptionController.clear();
  ticketOwnerController.clear();
  selectedDate.value="";
  selectedImage.value="";
  dueDateController.clear();
}

}