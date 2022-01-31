import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ComicsDetailsPage extends StatefulWidget {
  final int index;

  final int heroTag;
  const ComicsDetailsPage({
    Key? key,
    required this.index,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<ComicsDetailsPage> createState() => _ComicsDetailsPageState(index);
}

class _ComicsDetailsPageState extends State<ComicsDetailsPage> {
  final comicsStore = GetIt.I.get<ComicsStore>();
  final int index;

  _ComicsDetailsPageState(this.index);

  @override
  void initState() {
    super.initState();
    comicsStore.getComicsList();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int min = 6;
    int max = 10;
    double randomNumber = min + ((max - min) * Random().nextDouble());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondaryBlack,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              comicsStore.comicsModel![index].title.toString().toUpperCase(),
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
                    "${comicsStore.comicsModel![index].thumbnail!.path}.${comicsStore.comicsModel![index].thumbnail!.extension}",
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
                              "${comicsStore.comicsModel![index].thumbnail!.path}.${comicsStore.comicsModel![index].thumbnail!.extension}",
                              width: 120,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: starColor,
                              ),
                              Text(" " + randomNumber.toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text("Available in: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: titleColor,
                              )),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text("720p",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text("1080p",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
