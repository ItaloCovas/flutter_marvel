import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/series_store.dart';
import 'package:flutter_marvel/pages/home_page.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:get_it/get_it.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  final comicsStore = GetIt.I.get<SeriesStore>();
  @override
  void initState() {
    super.initState();
    comicsStore.getSeriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: secondaryBlack,
          elevation: 0,
          title: Center(
              child: Image.asset(
            "assets/images/logo_marvel.png",
            width: 100,
            height: 70,
          )),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [],
          ),
        ));
  }
}
