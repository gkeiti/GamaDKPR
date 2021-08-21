// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageViewController on _PageViewControllerBase, Store {
  final _$stateAtom = Atom(name: '_PageViewControllerBase.state');

  @override
  RegisterPageView get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(RegisterPageView value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_PageViewControllerBaseActionController =
      ActionController(name: '_PageViewControllerBase');

  @override
  dynamic updateIndex(int page) {
    final _$actionInfo = _$_PageViewControllerBaseActionController.startAction(
        name: '_PageViewControllerBase.updateIndex');
    try {
      return super.updateIndex(page);
    } finally {
      _$_PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
