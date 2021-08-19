// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_transactions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LastTransactionsController on _LastTransactionsControllerBase, Store {
  final _$totalAtom = Atom(name: '_LastTransactionsControllerBase.total');

  @override
  double? get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double? value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$lastTransactionsTotalAtom =
      Atom(name: '_LastTransactionsControllerBase.lastTransactionsTotal');

  @override
  ObservableStream<List<LastTransactionsModel>>? get lastTransactionsTotal {
    _$lastTransactionsTotalAtom.reportRead();
    return super.lastTransactionsTotal;
  }

  @override
  set lastTransactionsTotal(
      ObservableStream<List<LastTransactionsModel>>? value) {
    _$lastTransactionsTotalAtom.reportWrite(value, super.lastTransactionsTotal,
        () {
      super.lastTransactionsTotal = value;
    });
  }

  final _$_LastTransactionsControllerBaseActionController =
      ActionController(name: '_LastTransactionsControllerBase');

  @override
  dynamic getLastTransactionsTotal(String uid) {
    final _$actionInfo =
        _$_LastTransactionsControllerBaseActionController.startAction(
            name: '_LastTransactionsControllerBase.getLastTransactionsTotal');
    try {
      return super.getLastTransactionsTotal(uid);
    } finally {
      _$_LastTransactionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total},
lastTransactionsTotal: ${lastTransactionsTotal}
    ''';
  }
}
