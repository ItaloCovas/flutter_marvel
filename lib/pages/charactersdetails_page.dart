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
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            alignment: Alignment.center,
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Text("${characters.description}",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Series",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: charactersStore
                          .charactersModel![index].series!.items?.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                            title: Text(characters.series!.items![index].name!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15)));
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Comics",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: charactersStore
                          .charactersModel![index].comics!.items?.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                            title: Text(
                                characters.comics!.items!.isNotEmpty
                                    ? characters.comics!.items![index].name!
                                    : "No comics",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15)));
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Stories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: charactersStore
                          .charactersModel![index].stories!.items?.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                            title: Text(
                                characters.comics!.items!.isNotEmpty
                                    ? characters.stories!.items![index].name!
                                    : "No stories",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15)));
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Events",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: charactersStore
                          .charactersModel![index].events!.items?.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                            title: Text(
                                characters.comics!.items!.isNotEmpty
                                    ? characters.events!.items![index].name!
                                    : "No events",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15)));
                      }),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          );
        }));
  }
}
