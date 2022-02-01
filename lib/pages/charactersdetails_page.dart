import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/characters_store.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CharacterDetailsPage extends StatefulWidget {
  final int index;

  final int heroTag;
  const CharacterDetailsPage({
    Key? key,
    required this.index,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPage(index);
}

class _CharacterDetailsPage extends State<CharacterDetailsPage> {
  final int index;

  _CharacterDetailsPage(this.index);

  final charactersStore = GetIt.I.get<CharactersStore>();

  @override
  void initState() {
    super.initState();
    charactersStore.getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int min = 6;
    int max = 10;
    double randomNumber = min + ((max - min) * Random().nextDouble());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var characters = charactersStore.charactersModel![index];

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondaryBlack,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              characters.name.toString().toUpperCase(),
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
                    "${characters.thumbnail!.path}.${characters.thumbnail!.extension}",
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                              "${characters.thumbnail!.path}.${characters.thumbnail!.extension}",
                              width: 120,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 20),
                        child: Column(
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
                                  child: Text(
                                      "  " + randomNumber.toStringAsFixed(2),
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
                              "Series: " +
                                  (characters.series!.items!.isNotEmpty
                                      ? characters.series!.items![0].name!
                                      : "Series is not defined"),
                              style: const TextStyle(color: titleColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60, left: 20),
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
                        height: 15,
                      ),
                      Text("${characters.description}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Series",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${characters.series!.items![0].name}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Comics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${characters.comics!.items![0].name}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 25,
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
