import 'package:dio/dio.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:mobx/mobx.dart';

class ComicsApi {
  var dio = Dio();
  static const url =
      'https://gateway.marvel.com/v1/public/comics?ts=2201251159&apikey=1a5c3435222033e450f8a33cab175554&hash=3ea10f29ca253e31e0b2998c76f2fe67';
  Future<ObservableList<ComicsModel>?> getComics() async {
    try {
      Response response = await dio.get(url);

      List<ComicsModel> list =
          (response.data as List).map((e) => ComicsModel.fromJson(e)).toList();

      return ObservableList<ComicsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
