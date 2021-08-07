import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho_final_dgpr/modules/control/model/transactions_model.dart';

abstract class ControlRepository {
  Future<void> addTransaction(TransactionsModel transaction);
  Future<void> addBalance(double value, String type);
}

class ControlRepositoryImpl extends ControlRepository {
  @override
  Future<void> addTransaction(TransactionsModel transaction) async {
    try {
      FirebaseFirestore.instance.collection('/transactions').add({
        'category': transaction.category,
        'value': transaction.value,
        'createdAt': FieldValue.serverTimestamp(),
        'uid': transaction.uid,
        'type': transaction.type,
        'date': transaction.date,
        'month': transaction.month
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> addBalance(double value, type) async {
    final response = await FirebaseFirestore.instance
        .collection('balance')
        .where(FieldPath.documentId, isEqualTo: 'usuario')
        .get();
    if (response.docs.isNotEmpty) {
      List entrance = response.docs.map((e) => e['entrance']).toList();
      List out = response.docs.map((e) => e['out']).toList();
      print('ENTRANCE: $entrance');
      print('OUT: $out');
      if (type == 'in') {
        entrance[0] += value;
        FirebaseFirestore.instance
            .collection('/balance')
            .doc('usuario')
            .set({'entrance': entrance[0], 'out': out[0]});
      } else {
        out[0] += value;
        FirebaseFirestore.instance
            .collection('/balance')
            .doc('usuario')
            .set({'entrance': entrance[0], 'out': out[0]});
      }
    } else {
      if (type == 'in') {
        FirebaseFirestore.instance
            .collection('/balance')
            .doc('usuario')
            .set({'entrance': value, 'out': 0});
      } else {
        FirebaseFirestore.instance
            .collection('/balance')
            .doc('usuario')
            .set({'entrance': 0, 'out': value});
      }
    }
  }
}
