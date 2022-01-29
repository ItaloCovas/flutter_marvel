import 'package:flutter/material.dart';
import 'package:flutter_marvel/api/comics_api.dart';
import 'package:flutter_marvel/controller/characters_store.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/controller/series_store.dart';
import 'package:flutter_marvel/pages/comics_page.dart';
import 'package:flutter_marvel/pages/loading_page.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<ComicsStore>(ComicsStore());
  getIt.registerSingleton<SeriesStore>(SeriesStore());
  getIt.registerSingleton<CharactersStore>(CharactersStore());
  getIt.registerSingleton<ComicsApi>(ComicsApi());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Marvel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        home: const LoadingPage());
  }
}
