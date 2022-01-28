import 'package:flutter_marvel/api/characters_api.dart';
import 'package:flutter_marvel/api/series_api.dart';
import 'package:flutter_marvel/models/characters_model.dart';
import 'package:flutter_marvel/models/series_model.dart';
import 'package:mobx/mobx.dart';
part 'characters_store.g.dart';

class CharactersStore = _CharactersStoreBase with _$CharactersStore;

abstract class _CharactersStoreBase with Store {
  CharactersApi api = CharactersApi();

  @observable
  ObservableList<CharactersModel>? charactersModel;

  @observable
  int selectedIndex = 0;

  @observable
  bool isSearching = false;

  @observable
  String searchText = '';

  @action
  setSearchText(String value) {
    searchText = value;
  }

  @action
  toggleIsSearching() {
    isSearching = !isSearching;
  }

  @action
  getCharactersList() {
    api.getCharacters(name: searchText).then((charactersList) {
      charactersModel = charactersList;
      print('comics list changed');
      print(charactersModel);
    });
  }
}
