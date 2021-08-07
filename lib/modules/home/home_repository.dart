import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/widgets/transactions.dart';

abstract class HomeRepository {
  List<Widget> getItems(AsyncSnapshot snapshot);
  Future<String> getTotal();
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
      case 'Pagementos':
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
  Future<String> getTotal() async {
    final response = await FirebaseFirestore.instance
        .collection('/transactions')
        .limit(5)
        .orderBy('createdAt', descending: true)
        .get();
    List values = response.docs.map((e) => e['value']).toList();
    double sum = 0;
    for (var i = 0; i < values.length; i++) {
      sum += values[i] / 100;
    }
    return sum.toStringAsFixed(2);
  }
}
