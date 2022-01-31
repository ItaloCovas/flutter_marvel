import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/series_store.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SeriesDetailsPage extends StatefulWidget {
  final int index;
  final int heroTag;
  const SeriesDetailsPage(
      {Key? key, required this.index, required this.heroTag})
      : super(key: key);

  @override
  _SeriesDetailsPageState createState() => _SeriesDetailsPageState(index);
}

class _SeriesDetailsPageState extends State<SeriesDetailsPage> {
  final seriesStore = GetIt.I.get<SeriesStore>();
  final int index;

  _SeriesDetailsPageState(this.index);

  @override
  void initState() {
    super.initState();
    seriesStore.getSeriesList();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int min = 6;
    int max = 10;
    double randomNumber = min + ((max - min) * Random().nextDouble());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secondaryBlack,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            seriesStore.seriesModel![index].title.toString().toUpperCase(),
            style: const TextStyle(
              color: primaryButton,
              fontFamily: 'Marvel',
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              fontSize: 28,
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
      ),
      body: Observer(builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height - 50));
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(
                  "${seriesStore.seriesModel![index].thumbnail!.path}.${seriesStore.seriesModel![index].thumbnail!.extension}",
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Hero(
                      tag: widget.heroTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Colors.grey.shade400),
                          ),
                          child: Image.network(
                            "${seriesStore.seriesModel![index].thumbnail!.path}.${seriesStore.seriesModel![index].thumbnail!.extension}",
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: starColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  Text("  " + randomNumber.toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: titleColor,
                                      )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Creator: " +
                              seriesStore
                                  .seriesModel![index].creators!.items![0].name
                                  .toString(),
                          style: const TextStyle(color: titleColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Role: " +
                              seriesStore
                                  .seriesModel![index].creators!.items![0].role
                                  .toString(),
                          style: const TextStyle(color: titleColor),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Action / Adventure / Fantasy / Sci-Fi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Synopsis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${seriesStore.seriesModel![index].description}",
                        style: const TextStyle(
                          color: textSecondaryColor,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
