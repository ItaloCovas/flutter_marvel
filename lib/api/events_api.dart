import 'package:dio/dio.dart';
import 'package:flutter_marvel/models/events_model.dart';

import 'package:mobx/mobx.dart';

class EventsApi {
  var dio = Dio();
  static const url =
      'https://gateway.marvel.com/v1/public/events?ts=2201251159&apikey=1a5c3435222033e450f8a33cab175554&hash=3ea10f29ca253e31e0b2998c76f2fe67';
  Future<ObservableList<EventsModel>?> getEvents({String? name}) async {
    try {
      String urlName = url;

      if (name != '') {
        urlName = '$url&name=$name';
      }

      Response response = await dio.get(urlName);

      List<EventsModel> list = [];
      var result = response.data;

      for (var item in result['data']['results']) {
        EventsModel model = EventsModel.fromJson(item);
        if (model.thumbnail!.path !=
            'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
          list.add(model);
        }
      }

      return ObservableList<EventsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
