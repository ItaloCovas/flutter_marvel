// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComicsStore on _ComicsStoreBase, Store {
  final _$comicsModelAtom = Atom(name: '_ComicsStoreBase.comicsModel');

  @override
  ObservableList<ComicsModel>? get comicsModel {
    _$comicsModelAtom.reportRead();
    return super.comicsModel;
  }

  @override
  set comicsModel(ObservableList<ComicsModel>? value) {
    _$comicsModelAtom.reportWrite(value, super.comicsModel, () {
      super.comicsModel = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_ComicsStoreBase.selectedIndex');

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

  final _$isSearchingAtom = Atom(name: '_ComicsStoreBase.isSearching');

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

  final _$searchTextAtom = Atom(name: '_ComicsStoreBase.searchText');

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

  final _$_ComicsStoreBaseActionController =
      ActionController(name: '_ComicsStoreBase');

  @override
  dynamic setSearchText(String value) {
    final _$actionInfo = _$_ComicsStoreBaseActionController.startAction(
        name: '_ComicsStoreBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_ComicsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsSearching() {
    final _$actionInfo = _$_ComicsStoreBaseActionController.startAction(
        name: '_ComicsStoreBase.toggleIsSearching');
    try {
      return super.toggleIsSearching();
    } finally {
      _$_ComicsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getComicsList() {
    final _$actionInfo = _$_ComicsStoreBaseActionController.startAction(
        name: '_ComicsStoreBase.getComicsList');
    try {
      return super.getComicsList();
    } finally {
      _$_ComicsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
comicsModel: ${comicsModel},
selectedIndex: ${selectedIndex},
isSearching: ${isSearching},
searchText: ${searchText}
    ''';
  }
}
