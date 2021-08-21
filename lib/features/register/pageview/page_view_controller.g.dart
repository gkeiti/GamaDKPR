// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageViewController on _PageViewControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_PageViewControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_PageViewControllerBaseActionController =
      ActionController(name: '_PageViewControllerBase');

  @override
  dynamic updateIndex(int state) {
    final _$actionInfo = _$_PageViewControllerBaseActionController.startAction(
        name: '_PageViewControllerBase.updateIndex');
    try {
      return super.updateIndex(state);
    } finally {
      _$_PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
