// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceCardController on _BalanceCardControllerBase, Store {
  final _$balanceAtom = Atom(name: '_BalanceCardControllerBase.balance');

  @override
  ObservableStream<List<DtdModel>>? get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(ObservableStream<List<DtdModel>>? value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$_BalanceCardControllerBaseActionController =
      ActionController(name: '_BalanceCardControllerBase');

  @override
  dynamic getBalance(String uid, String month) {
    final _$actionInfo = _$_BalanceCardControllerBaseActionController
        .startAction(name: '_BalanceCardControllerBase.getBalance');
    try {
      return super.getBalance(uid, month);
    } finally {
      _$_BalanceCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
balance: ${balance}
    ''';
  }
}
