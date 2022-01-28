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

  final _$isSearchingAtom = Atom(name: '_SeriesStoreBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_SeriesStoreBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$_SeriesStoreBaseActionController =
      ActionController(name: '_SeriesStoreBase');

  @override
  dynamic setSearchText(String value) {
    final _$actionInfo = _$_SeriesStoreBaseActionController.startAction(
        name: '_SeriesStoreBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_SeriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsSearching() {
    final _$actionInfo = _$_SeriesStoreBaseActionController.startAction(
        name: '_SeriesStoreBase.toggleIsSearching');
    try {
      return super.toggleIsSearching();
    } finally {
      _$_SeriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
selectedIndex: ${selectedIndex},
isSearching: ${isSearching},
searchText: ${searchText}
    ''';
  }
}
