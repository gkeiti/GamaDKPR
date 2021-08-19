// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BudgetCardController on _BudgetCardControllerBase, Store {
  final _$visibleAtom = Atom(name: '_BudgetCardControllerBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$budgetAtom = Atom(name: '_BudgetCardControllerBase.budget');

  @override
  ObservableStream<List<BudgetModel>>? get budget {
    _$budgetAtom.reportRead();
    return super.budget;
  }

  @override
  set budget(ObservableStream<List<BudgetModel>>? value) {
    _$budgetAtom.reportWrite(value, super.budget, () {
      super.budget = value;
    });
  }

  final _$_BudgetCardControllerBaseActionController =
      ActionController(name: '_BudgetCardControllerBase');

  @override
  dynamic changeVisibility() {
    final _$actionInfo = _$_BudgetCardControllerBaseActionController
        .startAction(name: '_BudgetCardControllerBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$_BudgetCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getBudget(String uid) {
    final _$actionInfo = _$_BudgetCardControllerBaseActionController
        .startAction(name: '_BudgetCardControllerBase.getBudget');
    try {
      return super.getBudget(uid);
    } finally {
      _$_BudgetCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visible: ${visible},
budget: ${budget}
    ''';
  }
}
