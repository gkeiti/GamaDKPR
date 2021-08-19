// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControlController on _ControlControllerBase, Store {
  final _$allTransactionsAtom =
      Atom(name: '_ControlControllerBase.allTransactions');

  @override
  ObservableStream<List<AllTransactionsModel>>? get allTransactions {
    _$allTransactionsAtom.reportRead();
    return super.allTransactions;
  }

  @override
  set allTransactions(ObservableStream<List<AllTransactionsModel>>? value) {
    _$allTransactionsAtom.reportWrite(value, super.allTransactions, () {
      super.allTransactions = value;
    });
  }

  final _$_ControlControllerBaseActionController =
      ActionController(name: '_ControlControllerBase');

  @override
  dynamic getAllTransactionsValue(String uid, String month) {
    final _$actionInfo = _$_ControlControllerBaseActionController.startAction(
        name: '_ControlControllerBase.getAllTransactionsValue');
    try {
      return super.getAllTransactionsValue(uid, month);
    } finally {
      _$_ControlControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allTransactions: ${allTransactions}
    ''';
  }
}
