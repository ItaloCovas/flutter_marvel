import 'package:dio/dio.dart';

class ComicsApi {
  var dio = Dio();
  final url =
      "https://gateway.marvel.com:443/v1/public/comics?apikey=1a5c3435222033e450f8a33cab175554";

  Future<dynamic> getComics() async {
    try {
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
