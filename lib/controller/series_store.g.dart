// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SeriesStore on _SeriesStoreBase, Store {
  final _$seriesModelAtom = Atom(name: '_SeriesStoreBase.seriesModel');

  @override
  ObservableList<SeriesModel>? get seriesModel {
    _$seriesModelAtom.reportRead();
    return super.seriesModel;
  }

  @override
  set seriesModel(ObservableList<SeriesModel>? value) {
    _$seriesModelAtom.reportWrite(value, super.seriesModel, () {
      super.seriesModel = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_SeriesStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_SeriesStoreBaseActionController =
      ActionController(name: '_SeriesStoreBase');

  @override
  dynamic getSeriesList() {
    final _$actionInfo = _$_SeriesStoreBaseActionController.startAction(
        name: '_SeriesStoreBase.getSeriesList');
    try {
      return super.getSeriesList();
    } finally {
      _$_SeriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seriesModel: ${seriesModel},
selectedIndex: ${selectedIndex}
    ''';
  }
}
