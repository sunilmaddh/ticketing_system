class TicketListModel {
  final String name;
  final String dueDate;
  final String status;
  TicketListModel( {required this.dueDate,required this.status, required this.name});
  factory TicketListModel.fromMap(Map<String, dynamic> map) {
    return TicketListModel(
      name: map['name'],
      dueDate : map['due_date'],
      status : map['status'],
      );
  }
}
