// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/series_store.dart';

import 'package:flutter_marvel/pages/seriesdetails_page.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_marvel/widgets/bottomBar.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  final seriesStore = GetIt.I.get<SeriesStore>();

  @override
  void initState() {
    super.initState();
    seriesStore.getSeriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        backgroundColor: secondaryBlack,
        centerTitle: true,
        elevation: 0,
        title: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: seriesStore.isSearching
                ? Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      onSubmitted: (text) {
                        seriesStore.setSearchText(text);
                        seriesStore.getSeriesList();
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(bottom: 18, left: 10),
                        focusColor: Colors.black,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Marvel Series".toUpperCase(),
                      style: const TextStyle(
                        color: primaryButton,
                        fontFamily: 'Marvel',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                        fontSize: 35,
                        shadows: [
                          Shadow(
                            blurRadius: 6.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: IconButton(
                onPressed: () {
                  seriesStore.toggleIsSearching();
                },
                icon: const Icon(Icons.search)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Observer(builder: (_) {
                if (seriesStore.seriesModel != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 20 / 20,
                        viewportFraction: 0.6,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: seriesStore.seriesModel?.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        var series = seriesStore.seriesModel![index];
                        return Container(
                          child: Image.network(
                              "${series.thumbnail!.path}.${series.thumbnail!.extension}"),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              if (seriesStore.seriesModel != null) {
                return Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: seriesStore.seriesModel?.length,
                        itemBuilder: (ctx, index) {
                          var series = seriesStore.seriesModel![index];
                          return Hero(
                            tag: index,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => SeriesDetailsPage(
                                          index: index,
                                          heroTag: index,
                                        )));
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            series.title.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: "Marvel",
                                                letterSpacing: 0.5),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Image.network(
                                          "${series.thumbnail!.path}.${series.thumbnail!.extension}",
                                          width: 110,
                                          height: 160,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
