// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsStore on _EventsStoreBase, Store {
  final _$eventsModelAtom = Atom(name: '_EventsStoreBase.eventsModel');

  @override
  ObservableList<EventsModel>? get eventsModel {
    _$eventsModelAtom.reportRead();
    return super.eventsModel;
  }

  @override
  set eventsModel(ObservableList<EventsModel>? value) {
    _$eventsModelAtom.reportWrite(value, super.eventsModel, () {
      super.eventsModel = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_EventsStoreBase.selectedIndex');

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

  final _$isSearchingAtom = Atom(name: '_EventsStoreBase.isSearching');

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

  final _$searchTextAtom = Atom(name: '_EventsStoreBase.searchText');

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

  final _$_EventsStoreBaseActionController =
      ActionController(name: '_EventsStoreBase');

  @override
  dynamic setSearchText(String value) {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsSearching() {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.toggleIsSearching');
    try {
      return super.toggleIsSearching();
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEventsList() {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.getEventsList');
    try {
      return super.getEventsList();
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventsModel: ${eventsModel},
selectedIndex: ${selectedIndex},
isSearching: ${isSearching},
searchText: ${searchText}
    ''';
  }
}
