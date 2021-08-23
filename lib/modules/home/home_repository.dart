import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/budget/budget_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/transactions.dart';
import 'widgets/balance/dtd_model.dart';
import 'widgets/last_transactions/last_transactions_model.dart';

abstract class HomeRepository {
  List<Widget> getItems(AsyncSnapshot snapshot);
  Stream<List<BudgetModel>> getBudget(String uid);
  Stream<List<DtdModel>> getBalance(String uid, String month);
  Stream<List<LastTransactionsModel>> getLastTransactionsTotal(String uid);
  Future<void> updateRegister(UserData user);
}

class HomeRepositoryImpl extends HomeRepository {
  CollectionReference transactions =
      FirebaseFirestore.instance.collection('/transactions');

  @override
  List<Widget> getItems(AsyncSnapshot snapshot) {
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

  @override
  Stream<List<LastTransactionsModel>> getLastTransactionsTotal(String uid) {
    return FirebaseFirestore.instance
        .collection('/transactions')
        .limit(3)
        .orderBy('createdAt', descending: true)
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return LastTransactionsModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<List<BudgetModel>> getBudget(String uid) {
    return FirebaseFirestore.instance
        .collection('/budget')
        .where(FieldPath.documentId, isEqualTo: uid)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return BudgetModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<List<DtdModel>> getBalance(String uid, String month) {
    return FirebaseFirestore.instance
        .collection('/balance')
        .doc(uid)
        .collection(month)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return DtdModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<void> updateRegister(UserData user) async {
    await FirebaseFirestore.instance.collection('/users').doc(user.uid).update({
      'name': user.name,
      'cpf': user.cpf,
      'email': user.email,
      'phone': user.phone
    });
    await FirebaseAuth.instance.currentUser!.updateEmail(user.email);
    await FirebaseAuth.instance.signOut();
  }
}
