class TransactionsModel {
  String category;
  double value;
  String uid;
  int? createdAt;
  String type;
  String date;
  String month;
  String name;

  TransactionsModel({
    required this.category,
    required this.value,
    required this.uid,
    this.createdAt,
    required this.type,
    required this.date,
    required this.month,
    required this.name,
  });
}
