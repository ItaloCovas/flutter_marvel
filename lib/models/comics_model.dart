import 'dart:convert';
import 'package:intl/intl.dart';

class ComicsModel {
  int id;
  String title;
  int pageCount;
  double price;
  String thumbnailPath;
  String thumbnailExtension;
  String thumbnail;
  String rawModified;
  String modified;
  String description;
  String jsonCache;

  ComicsModel({
    required this.id,
    required this.title,
    required this.pageCount,
    required this.price,
    required this.thumbnailPath,
    required this.thumbnailExtension,
    required this.thumbnail,
    required this.rawModified,
    required this.modified,
    required this.description,
    required this.jsonCache,
  });

  factory ComicsModel.from(ComicsModel comic) {
    return ComicsModel(
      id: comic.id,
      title: comic.title,
      pageCount: comic.pageCount,
      price: comic.price,
      thumbnailPath: comic.thumbnailPath,
      thumbnailExtension: comic.thumbnailExtension,
      thumbnail: comic.thumbnail,
      rawModified: comic.rawModified,
      modified: comic.modified,
      description: comic.description,
      jsonCache: comic.jsonCache,
    );
  }

  factory ComicsModel.fromJson(Map<String, dynamic> response) {
    return ComicsModel(
      id: response["id"],
      title: response['title'],
      pageCount: response['pageCount'],
      price: response['prices'][0]['price'] is int
          ? response['prices'][0]['price'].toDouble()
          : response['prices'][0]['price'],
      thumbnailPath: response['thumbnail']['path'],
      thumbnailExtension: response['thumbnail']['extension'],
      thumbnail: response['thumbnail']['path'] +
          '/portrait_xlarge.' +
          response['thumbnail']['extension'],
      rawModified: response['modified'],
      modified: DateFormat('dd/MM/yyyy H:mm ').format(DateTime.parse(
          response['modified'])), //ALgumas datas vem da api com o ano 0001
      description:
          response['description'] ?? 'Nenhuma descrição informada pela API.',
      jsonCache: json.encode(response),
    );
  }

  Map toJson() => {
        'id': id,
        'title': title,
        'pageCount': pageCount,
        'prices': json.decode(jsonCache)['prices'],
        'thumbnail': json.decode(jsonCache)['thumbnail'],
        'modified': rawModified,
        'description': description,
      };
}
