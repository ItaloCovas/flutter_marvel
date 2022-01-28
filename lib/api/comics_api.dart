import 'package:dio/dio.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:mobx/mobx.dart';

class ComicsApi {
  var dio = Dio();
  String url =
      'https://gateway.marvel.com/v1/public/comics?ts=2201251159&apikey=1a5c3435222033e450f8a33cab175554&hash=3ea10f29ca253e31e0b2998c76f2fe67';

  Future<ObservableList<ComicsModel>?> getComics({String? title}) async {
    try {
      String urlTitle = url;

      if (title != '') {
        urlTitle = '$url&title=$title';
      }
      Response response = await dio.get(urlTitle);

      List<ComicsModel> list = [];
      var result = response.data;

      for (var item in result['data']['results']) {
        ComicsModel model = ComicsModel.fromJson(item);
        if (model.thumbnail!.path !=
            "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available") {
          list.add(model);
        }
      }

      return ObservableList<ComicsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
