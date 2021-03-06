// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersStore on _CharactersStoreBase, Store {
  final _$charactersModelAtom =
      Atom(name: '_CharactersStoreBase.charactersModel');

  @override
  ObservableList<CharactersModel>? get charactersModel {
    _$charactersModelAtom.reportRead();
    return super.charactersModel;
  }

  @override
  set charactersModel(ObservableList<CharactersModel>? value) {
    _$charactersModelAtom.reportWrite(value, super.charactersModel, () {
      super.charactersModel = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_CharactersStoreBase.selectedIndex');

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

  final _$isSearchingAtom = Atom(name: '_CharactersStoreBase.isSearching');

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

  final _$searchTextAtom = Atom(name: '_CharactersStoreBase.searchText');

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

  final _$_CharactersStoreBaseActionController =
      ActionController(name: '_CharactersStoreBase');

  @override
  dynamic setSearchText(String value) {
    final _$actionInfo = _$_CharactersStoreBaseActionController.startAction(
        name: '_CharactersStoreBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsSearching() {
    final _$actionInfo = _$_CharactersStoreBaseActionController.startAction(
        name: '_CharactersStoreBase.toggleIsSearching');
    try {
      return super.toggleIsSearching();
    } finally {
      _$_CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCharactersList() {
    final _$actionInfo = _$_CharactersStoreBaseActionController.startAction(
        name: '_CharactersStoreBase.getCharactersList');
    try {
      return super.getCharactersList();
    } finally {
      _$_CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
charactersModel: ${charactersModel},
selectedIndex: ${selectedIndex},
isSearching: ${isSearching},
searchText: ${searchText}
    ''';
  }
}
