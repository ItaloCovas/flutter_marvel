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
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(1),
                      backgroundColor.withOpacity(0.4),
                      backgroundColor.withOpacity(0.3),
                      backgroundColor.withOpacity(0.2),
                      backgroundColor.withOpacity(0.1),
                      backgroundColor.withOpacity(0),
                    ])),
              )),
              Positioned(
                  top: 190,
                  left: 50,
                  child: Hero(
                    tag: widget.heroTag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.grey.shade400),
                        ),
                        child: Image.network(
                          "${comicsStore.comicsModel![index].thumbnail!.path}.${comicsStore.comicsModel![index].thumbnail!.extension}",
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 230,
                  left: 200,
                  child: Container(
                    child: Icon(
                      Icons.star_rounded,
                      color: starColor,
                    ),
                  ))
            ],
          );
        }));
  }
}
