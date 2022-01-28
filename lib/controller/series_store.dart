import 'package:flutter_marvel/api/series_api.dart';
import 'package:flutter_marvel/models/series_model.dart';
import 'package:mobx/mobx.dart';
part 'series_store.g.dart';

class SeriesStore = _SeriesStoreBase with _$SeriesStore;

abstract class _SeriesStoreBase with Store {
  SeriesApi api = SeriesApi();

  @observable
  ObservableList<SeriesModel>? seriesModel;

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
  getSeriesList() {
    api.getSeries(title: searchText).then((seriesList) {
      seriesModel = seriesList;
      print('comics list changed');
      print(seriesModel);
    });
  }
}
