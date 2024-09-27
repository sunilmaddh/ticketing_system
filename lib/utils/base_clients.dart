import 'package:flutter/material.dart';
import 'package:ticketing_system/utils/api_services.dart';
import 'package:http/http.dart' as http;

class BaseClients extends ApiServices{
  http.Response customResponse = http.Response("Something went wrong", 1000);
  @override
  Future<http.Response?> get(String url) async{
try{
Uri uri=Uri.parse(url);
http.Response? response=await http.get(uri);
   return response;
}catch(e){
debugPrint(e.toString());
}
return customResponse;
  }
  
@override
Future<http.Response?> post({required var data}) async{
String url="";
try{
Uri uri=Uri.parse(url);
http.Response? response=await http.post(uri,
body: data,
headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer <token>',
  },
);
   return response;
}catch(e){
  debugPrint(e.toString());
}
return customResponse;
  }
  }

  
