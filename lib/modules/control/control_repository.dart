import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/control/model/balance_model.dart';
import 'package:trabalho_final_dgpr/modules/control/model/transactions_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/widgets/transactions.dart';

import 'model/all_transactions_model.dart';

abstract class ControlRepository {
  Future<void> addTransaction(TransactionsModel transaction);
  Future<void> addBalance(BalanceModel balance);
  Future<void> addBudget(String uid, double total);
  Stream<List<AllTransactionsModel>> getAllTransactionsValue(
      String uid, String month);
  List<Widget> getAllTransactions(AsyncSnapshot snapshot);
  /* Stream<List<AllTransactionsModel>> getAllTransactions(
      String uid, String type); */
}

class ControlRepositoryImpl extends ControlRepository {
  CollectionReference transactions =
      FirebaseFirestore.instance.collection('/transactions');
  @override
  Future<void> addTransaction(TransactionsModel transaction) async {
    try {
      await FirebaseFirestore.instance.collection('/transactions').add({
        'category': transaction.category,
        'value': transaction.value,
        'createdAt': FieldValue.serverTimestamp(),
        'uid': transaction.uid,
        'type': transaction.type,
        'date': transaction.date,
        'month': transaction.month,
        'name': transaction.name,
      });
    } catch (e) {
      throw (e);
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

  @override
  Stream<List<AllTransactionsModel>> getAllTransactionsValue(
      String uid, String month) {
    return FirebaseFirestore.instance
        .collection('/balance')
        .doc(uid)
        .collection(month)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return AllTransactionsModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  List<Widget> getAllTransactions(AsyncSnapshot snapshot) {
    return snapshot.data!.docs
        .map<Widget>(
          (e) => Transactions(
            category: e['category'],
            date: e['date'],
            value: (e['value'] / 100),
            url: getIcon(e['category']),
            backgroundColor: getColor(e['category']),
            name: e['name'],
          ),
        )
        .toList();
  }

  getIcon(String category) {
    String url = '';
    switch (category) {
      case 'Refeição':
        url = 'assets/logos/refeição.png';
        break;
      case 'Viagem':
        url = 'assets/logos/viagem.png';
        break;
      case 'Transporte':
        url = 'assets/logos/transporte.png';
        break;
      case 'Educação':
        url = 'assets/logos/educação.png';
        break;
      case 'Pagamentos':
        url = 'assets/logos/pagamentos.png';
        break;
      case 'Outros':
        url = 'assets/logos/outros.png';
        break;
      case 'PIX':
        url = 'assets/logos/pix.png';
        break;
      case 'Dinheiro':
        url = 'assets/logos/dinheiro.png';
        break;
      case 'DOC':
        url = 'assets/logos/doc_ted.png';
        break;
      case 'TED':
        url = 'assets/logos/doc_ted.png';
        break;
      case 'Boleto':
        url = 'assets/logos/boleto.png';
        break;
      default:
        url = '';
        break;
    }
    return url;
  }

  getColor(String category) {
    Color circleColor = Colors.white;
    switch (category) {
      case 'Refeição':
        circleColor = AppColors.yellow;
        break;
      case 'Viagem':
        circleColor = AppColors.pink;
        break;
      case 'Transporte':
        circleColor = AppColors.green;
        break;
      case 'Educação':
        circleColor = AppColors.cyan;
        break;
      case 'Outros':
        circleColor = AppColors.lightPurple;
        break;
      default:
        circleColor = AppColors.purple;
        break;
    }
    return circleColor;
  }
}
