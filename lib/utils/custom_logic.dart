import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_system/utils/toast_utils.dart';

class CustomLogic {
  File? _image;
  String imagePath="";
  final ImagePicker _picker = ImagePicker();
  // Function to pick an image from the gallery
  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      imagePath=_image!.path;
    } else {
      ToastUtils.instance.showToast(message: "Image not selected");
    }
    return _image; 
  }
  // Function to capture an image from the camera
  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      ToastUtils.instance.showToast(message: "Image not capture");
    }
    return _image; 
  }

 static Future<String> selectDueDate(BuildContext context) async {
    String selectedDate='';
  final DateTime? picked = await showDatePicker(
    context: context,
   // Corrected value access
     initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  
  if (picked != null) {
    var formatter = DateFormat('yyyy-MMM-dd'); // DateFormat constructor doesn't need 'new'
    selectedDate = formatter.format(picked); // Only call format if `picked` is not null

    

  }
  return selectedDate;
}
}
