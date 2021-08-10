import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho_final_dgpr/modules/control/model/balance_model.dart';
import 'package:trabalho_final_dgpr/modules/control/model/transactions_model.dart';

abstract class ControlRepository {
  Future<void> addTransaction(TransactionsModel transaction);
  Future<void> addBalance(BalanceModel balance);
  Future<void> addBudget(String uid, double total);
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
  Future<void> addBalance(BalanceModel balance) async {
    final response = await FirebaseFirestore.instance
        .collection('/balance')
        .doc(balance.uid)
        .collection(balance.month)
        .where('uid', isEqualTo: balance.uid)
        .where('month', isEqualTo: balance.month)
        .get();
    if (response.docs.isNotEmpty) {
      List entrance = response.docs.map((e) => e['entrance']).toList();
      List out = response.docs.map((e) => e['out']).toList();
      if (balance.type == 'in') {
        entrance[0] += balance.entrance;
        FirebaseFirestore.instance
            .collection('/balance')
            .doc(balance.uid)
            .collection(balance.month)
            .doc(balance.uid)
            .set({'entrance': entrance[0], 'out': out[0]},
                SetOptions(merge: true));
      } else {
        out[0] += balance.out;
        FirebaseFirestore.instance
            .collection('/balance')
            .doc(balance.uid)
            .collection(balance.month)
            .doc(balance.uid)
            .set({'entrance': entrance[0], 'out': out[0]},
                SetOptions(merge: true));
      }
    } else {
      if (balance.type == 'in') {
        FirebaseFirestore.instance
            .collection('/balance')
            .doc(balance.uid)
            .collection(balance.month)
            .doc(balance.uid)
            .set({
          'entrance': balance.entrance,
          'out': balance.out,
          'uid': balance.uid,
          'month': balance.month
        });
      } else {
        FirebaseFirestore.instance
            .collection('/balance')
            .doc(balance.uid)
            .collection(balance.month)
            .doc(balance.uid)
            .set({
          'entrance': balance.entrance,
          'out': balance.out,
          'uid': balance.uid,
          'month': balance.month
        });
      }
    }
  }

  @override
  Future<void> addBudget(String uid, double total) async {
    final response = await FirebaseFirestore.instance
        .collection('/budget')
        .where(FieldPath.documentId, isEqualTo: uid)
        .get();
    if (response.docs.isNotEmpty) {
      List budget = response.docs.map((e) => e['budget']).toList();
      print('BUDGET: $budget');
      budget[0] += total;
      FirebaseFirestore.instance
          .collection('/budget')
          .doc(uid)
          .set({'budget': budget[0]}, SetOptions(merge: true));
    } else {
      FirebaseFirestore.instance.collection('/budget').doc(uid).set({
        'budget': total,
      });
    }
  }
}
