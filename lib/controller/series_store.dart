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

  @action
  getSeriesList() {
    api.getSeries().then((seriesList) {
      seriesModel = seriesList;
      print('comics list changed');
      print(seriesModel);
    });
  }
}
