import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ComicsApi {
  String API_PUBLIC_KEY = '1a5c3435222033e450f8a33cab175554';
  String API_PRIVATE_KEY = 'cc6d7f95d7d9445ee25169a050a4bd4c917815dc';

  Future<dynamic> getComics() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyMMddkkmm').format(now);

    var response = await http.get(
      Uri.https('gateway.marvel.com', 'v1/public/comics', {
        "ts": formattedDate,
        "apikey": API_PUBLIC_KEY,
        "hash": md5
            .convert(
                utf8.encode(formattedDate + API_PRIVATE_KEY + API_PUBLIC_KEY))
            .toString(),
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data']['results'];
      List<DadosComic> comics =
          List<DadosComic>.from(data.map((i) => DadosComic.fromJson(i)));
      return comics;
    } else if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      throw json.decode(response.body);
    }
  }
}
