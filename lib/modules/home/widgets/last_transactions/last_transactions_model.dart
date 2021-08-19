import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class LastTransactionsModel {
  double value;
  LastTransactionsModel({
    required this.value,
  });

  factory LastTransactionsModel.fromDocument(DocumentSnapshot doc) {
    return LastTransactionsModel(value: doc['value']);
  }
}
