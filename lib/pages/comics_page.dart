import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/pages/comicsdetails_page.dart';
import 'package:flutter_marvel/pages/home_page.dart';
import 'package:flutter_marvel/pages/series_page.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_marvel/widgets/search.dart';
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
    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          backgroundColor: secondaryBlack.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 14,
          selectedIconTheme:
              const IconThemeData(color: primaryButton, size: 30),
          selectedItemColor: primaryButton,
          unselectedItemColor: titleColor,
          currentIndex: comicsStore.selectedIndex,
          onTap: (index) => comicsStore.selectedIndex = index,
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
            "Marvel Comics".toUpperCase(),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchWidget()));
                },
                icon: const Icon(Icons.search)),
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
                if (comicsStore.comicsModel != null) {
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
                      itemCount: comicsStore.comicsModel?.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        var comics = comicsStore.comicsModel![index];
                        return Container(
                          child: Image.network(comics.thumbnailPath +
                              "." +
                              comics.thumbnailExtension),
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
            Divider(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              if (comicsStore.comicsModel != null) {
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
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: comicsStore.comicsModel?.length,
                        itemBuilder: (ctx, index) {
                          var comics = comicsStore.comicsModel![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ComicsDetailsPage()));
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
                                          comics.title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "Marvel",
                                              letterSpacing: 0.5),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.network(
                                        comics.thumbnailPath +
                                            "." +
                                            comics.thumbnailExtension,
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
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
