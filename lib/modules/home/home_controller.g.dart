// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$totalAtom = Atom(name: '_HomeControllerBase.total');

  @override
  String? get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(String? value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$repositoryCallAtom = Atom(name: '_HomeControllerBase.repositoryCall');

  @override
  ObservableFuture<String>? get repositoryCall {
    _$repositoryCallAtom.reportRead();
    return super.repositoryCall;
  }

  @override
  set repositoryCall(ObservableFuture<String>? value) {
    _$repositoryCallAtom.reportWrite(value, super.repositoryCall, () {
      super.repositoryCall = value;
    });
  }

  final _$getTotalAsyncAction = AsyncAction('_HomeControllerBase.getTotal');

  @override
  Future<void> getTotal() {
    return _$getTotalAsyncAction.run(() => super.getTotal());
  }

  @override
  String toString() {
    return '''
total: ${total},
repositoryCall: ${repositoryCall}
    ''';
  }
}
