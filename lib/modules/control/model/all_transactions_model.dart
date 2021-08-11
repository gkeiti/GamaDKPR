import 'package:cloud_firestore/cloud_firestore.dart';

class AllTransactionsModel {
  double entrance;
  double out;
  AllTransactionsModel({
    required this.entrance,
    required this.out,
  });

  factory AllTransactionsModel.fromDocument(DocumentSnapshot doc) {
    return AllTransactionsModel(entrance: doc['entrance'], out: doc['out']);
  }
}
