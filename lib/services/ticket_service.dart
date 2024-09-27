import 'package:http/http.dart' as http;
import 'package:ticketing_system/utils/base_clients.dart';
class TicketService{
  final _client=BaseClients();
  Future<Map<String, dynamic>> fetchTicketList()async{
    http.Response? response=await _client.get("");
    Map<String,dynamic> responseData={
      "responseCode":response!.statusCode,
      "response":response.body
    };
  return responseData;
  }
   Future<Map<String, dynamic>> createTicket({required var data})async{
    http.Response? response=await _client.post(data: data);
    Map<String,dynamic> responseData={
      "responseCode":response!.statusCode,
      "response":response.body
    };

  return responseData;
  }
}