import 'package:flutter_marvel/api/comics_api.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:mobx/mobx.dart';
part 'comics_store.g.dart';

class ComicsStore = _ComicsStoreBase with _$ComicsStore;

abstract class _ComicsStoreBase with Store {
  ComicsApi api = ComicsApi();

  @observable
  ObservableList<ComicsModel>? comicsModel;

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
  getComicsList() {
    api.getComics(title: searchText).then((comicsList) {
      comicsModel = comicsList;
      print('comics list changed');
      print(comicsModel);
    });
  }
}
