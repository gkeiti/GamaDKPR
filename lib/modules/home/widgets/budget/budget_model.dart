import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetModel {
  double value;
  BudgetModel({
    required this.value,
  });

  factory BudgetModel.fromDocument(DocumentSnapshot doc) {
    return BudgetModel(value: doc['budget']);
  }
}
