import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/components/custom_form_field.dart';
import 'package:ticketing_system/controllers/ticket_home_controller.dart';
import 'package:ticketing_system/utils/custom_logic.dart';
import 'package:ticketing_system/utils/toast_utils.dart'; 


class TicketForm extends StatefulWidget {
  const TicketForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TicketFormState createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  final _formKey = GlobalKey<FormState>();
  final _ticketHomeController=Get.find<TicketHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                CustomTextFormField(
                  controller: _ticketHomeController.nameController, 
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  }, 
                ),
                 CustomTextFormField(
                  controller: _ticketHomeController.contactController, 
                  labelText: 'Contact',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _ticketHomeController.accountNameController, 
                  labelText: 'Account Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter account name';
                    }
                    return null;
                  },
                ),
                 CustomTextFormField(
                  controller: _ticketHomeController.emailController, 
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                 CustomTextFormField(
                  controller:_ticketHomeController.subjectController , 
                  labelText: 'Subject',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _ticketHomeController.descriptionController, 
                  labelText: 'Description',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                 
                ),
               
                GestureDetector(
                  onTap: ()async {
                    _ticketHomeController.selectedDate.value=await CustomLogic.selectDueDate(context);
                
                  },  child:Obx(()=> AbsorbPointer(
                    child:  CustomTextFormField(
                  controller: TextEditingController(text: _ticketHomeController.selectedDate.value), 
                  labelText: 'Due date',
                      validator: (value) {
                        if (_ticketHomeController.selectedDate.isEmpty) {
                          return 'Please select a due date';
                        }
                        return null;
                      }, 
                    ),
                    )  ),
                ),
                CustomTextFormField(
                  controller: _ticketHomeController.descriptionController, 
                  labelText: 'Ticket Owner',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please assign a ticket owner';
                    }
                    return null;
                  },
                ),
                 GestureDetector(
                  onTap: ()async{
                  _showImagePickerOptions(context);
                  },
                   child: AbsorbPointer(
                     child: CustomTextFormField(
                      controller: _ticketHomeController.descriptionController, 
                      labelText: 'Attachment',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please upload an attachment';
                        }
                        return null;
                      },
                                   ),
                   ),
                 ),

                 const SizedBox(height: 20,),

             Obx(()=>_ticketHomeController.selectedImage.isNotEmpty?Image.file(File(_ticketHomeController.selectedImage.value),
             height: 100,
             
             ):const SizedBox()),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ToastUtils.instance.showToast(message: "Form submited successfully");
                          Get.back();
                         
                        }
                      },
                      child: const Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  void _showImagePickerOptions(BuildContext context) async{
  File? selectedImagePath;
    showModalBottomSheet(
      
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
                ElevatedButton(
                  onPressed:() async {
                 File? imageFile = await CustomLogic().pickImageFromGallery();
                  if (imageFile != null) {
                    _ticketHomeController.selectedImage.value = imageFile.path;
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, selectedImagePath);
                  },
                  child: const Text("Gallery"),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed:() async {
                 File? imageFile = await CustomLogic().pickImageFromCamera();
                  if (imageFile != null) {
                    _ticketHomeController.selectedImage.value = imageFile.path;
            
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, selectedImagePath);
                  },
                  child: const Text("Camera"),
                ),
              ],
            ),
          ),
        );
      },
    );

   
  }

}


