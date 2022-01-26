import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:flutter_marvel/models/series_model.dart';
import 'package:mobx/mobx.dart';

class SeriesApi {
  var dio = Dio();
  static const url =
      'https://gateway.marvel.com/v1/public/series?ts=2201251159&apikey=1a5c3435222033e450f8a33cab175554&hash=3ea10f29ca253e31e0b2998c76f2fe67';
  Future<ObservableList<SeriesModel>?> getSeries() async {
    try {
      Response response = await dio.get(url);

      List<SeriesModel> list = [];
      var result = response.data;

      for (var item in result['data']['results']) {
        SeriesModel model = SeriesModel.fromJson(item);
        list.add(model);
      }

      return ObservableList<SeriesModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
