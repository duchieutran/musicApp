// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigatorStore on NavigatorBase, Store {
  late final _$indexCurrentAtom =
      Atom(name: 'NavigatorBase.indexCurrent', context: context);

  @override
  int get indexCurrent {
    _$indexCurrentAtom.reportRead();
    return super.indexCurrent;
  }

  @override
  set indexCurrent(int value) {
    _$indexCurrentAtom.reportWrite(value, super.indexCurrent, () {
      super.indexCurrent = value;
    });
  }

  late final _$NavigatorBaseActionController =
      ActionController(name: 'NavigatorBase', context: context);

  @override
  void setIndex(int value) {
    final _$actionInfo = _$NavigatorBaseActionController.startAction(
        name: 'NavigatorBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$NavigatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexCurrent: ${indexCurrent}
    ''';
  }
}
