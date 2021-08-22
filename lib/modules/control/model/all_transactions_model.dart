import 'package:cloud_firestore/cloud_firestore.dart';

class AllTransactionsModel {
  double entrance;
  double out;
  double total;
  AllTransactionsModel({
    required this.entrance,
    required this.out,
    required this.total,
  });

  factory AllTransactionsModel.fromDocument(DocumentSnapshot doc) {
    return AllTransactionsModel(
      entrance: doc['entrance'],
      out: doc['out'],
      total: doc['entrance'] + doc['out'],
    );
  }
}
