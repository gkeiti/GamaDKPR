import 'package:cloud_firestore/cloud_firestore.dart';

class DtdModel {
  double entrance;
  double out;
  DtdModel({
    required this.entrance,
    required this.out,
  });

  factory DtdModel.fromDocument(DocumentSnapshot doc) {
    return DtdModel(entrance: doc['entrance'], out: doc['out']);
  }
}
