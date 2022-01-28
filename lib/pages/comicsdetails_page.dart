import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ComicsDetailsPage extends StatefulWidget {
  final int index;
  ComicsDetailsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ComicsDetailsPage> createState() => _ComicsDetailsPageState(this.index);
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
        if (comicsStore.comicsModel != null) {
          return Stack(
            children: [
              Image.network(
                "${comicsStore.comicsModel![index].thumbnail!.path}.${comicsStore.comicsModel![index].thumbnail!.extension}",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                  child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(0),
                      backgroundColor.withOpacity(0),
                      backgroundColor.withOpacity(0),
                      backgroundColor.withOpacity(0),
                      backgroundColor.withOpacity(0),
                    ])),
              )),
            ],
          );
        } else {
          return Center();
        }
      }),
    );
  }
}
