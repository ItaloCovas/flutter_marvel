// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/series_store.dart';
import 'package:flutter_marvel/pages/home_page.dart';
import 'package:flutter_marvel/themes/theme.dart';
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
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          backgroundColor: secondaryBlack.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: primaryButton,
          unselectedItemColor: titleColor,
          currentIndex: seriesStore.selectedIndex,
          onTap: (index) => seriesStore.selectedIndex = index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontFamily: "Marvel",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    shadows: [
                      Shadow(
                        blurRadius: 6.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.live_tv_rounded,
                ),
                title: Text(
                  "Series",
                  style: TextStyle(
                      fontFamily: "Marvel",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation),
                title: Text(
                  "Movies",
                  style: TextStyle(
                      fontFamily: "Marvel",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ))
          ],
        );
      }),
      appBar: AppBar(
        backgroundColor: secondaryBlack,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            "Marvel Series".toUpperCase(),
            style: const TextStyle(
              color: primaryButton,
              fontFamily: 'Marvel',
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              fontSize: 40,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          )
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
          children: [
            Container(
              child: Observer(builder: (_) {
                if (seriesStore.seriesModel != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 20 / 15,
                        viewportFraction: 0.5,
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
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: seriesStore.seriesModel?.length,
                        itemBuilder: (ctx, index) {
                          var series = seriesStore.seriesModel![index];
                          return GestureDetector(
                            onTap: () {
                              print('click');
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
                                        padding: const EdgeInsets.only(left: 5),
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
