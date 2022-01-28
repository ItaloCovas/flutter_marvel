import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_marvel/models/characters_model.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:flutter_marvel/models/series_model.dart';
import 'package:mobx/mobx.dart';

class CharactersApi {
  var dio = Dio();
  static const url =
      'https://gateway.marvel.com/v1/public/characters?ts=2201251159&apikey=1a5c3435222033e450f8a33cab175554&hash=3ea10f29ca253e31e0b2998c76f2fe67';
  Future<ObservableList<CharactersModel>?> getCharacters() async {
    try {
      Response response = await dio.get(url);

      List<CharactersModel> list = [];
      var result = response.data;

      for (var item in result['data']['results']) {
        CharactersModel model = CharactersModel.fromJson(item);
        if (model.thumbnail!.path !=
            'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
          list.add(model);
        }
      }

      return ObservableList<CharactersModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
