import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel/api/comics_api.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/pages/home_page.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({Key? key}) : super(key: key);

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  final comicsStore = GetIt.I.get<ComicsStore>();
  @override
  void initState() {
    super.initState();
    comicsStore.getComicsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        child: Observer(builder: (_) {
          if (comicsStore.comicsModel != null) {
            return CarouselSlider.builder(
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: comicsStore.comicsModel?.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                var comics = comicsStore.comicsModel![index];
                return Container(
                  child: Image.network(
                      comics.thumbnailPath + "." + comics.thumbnailExtension),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
