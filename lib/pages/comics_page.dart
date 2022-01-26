import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
    var height = MediaQuery.of(context).size.height;
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
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
              Observer(builder: (_) {
                if (comicsStore.comicsModel != null) {
                  return Flexible(
                    fit: FlexFit.loose,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: comicsStore.comicsModel?.length,
                        itemBuilder: (ctx, index) {
                          var comics = comicsStore.comicsModel![index];
                          return GestureDetector(
                            onTap: () {
                              print('click');
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    color: secondaryBlack,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Center(
                                      child: Text(
                                        comics.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                      ),
                                      child: Image.network(
                                        comics.thumbnailPath +
                                            "." +
                                            comics.thumbnailExtension,
                                        width: 140,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        }),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
