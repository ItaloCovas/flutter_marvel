import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/models/comics_model.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    List<ComicsModel> newList = [];
    final comicsStore = GetIt.I.get<ComicsStore>();
    @override
    void initState() {
      super.initState();
      comicsStore.getComicsList();
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: secondaryBlack,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1, color: textSecondaryColor),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    newList = comicsStore.comicsModel!.where((item) {
                      var itemTitle = item.title.toLowerCase();
                      return itemTitle.contains(text);
                    }).toList();
                  });
                },
                cursorColor: Colors.white,
                style: const TextStyle(color: titleColor, fontSize: 16),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 9),
                    hintStyle: const TextStyle(
                      color: titleColor,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: titleColor,
                      size: 16,
                    ),
                    suffixIcon: IconButton(
                      icon:
                          const Icon(Icons.clear, color: titleColor, size: 16),
                      onPressed: () {},
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Column(
        children: [
          Observer(builder: (_) {
            if (comicsStore.comicsModel != null) {
              return Flexible(
                fit: FlexFit.loose,
                child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: ListView.builder(
                        itemCount: newList.length,
                        itemBuilder: (ctx, index) {
                          var comics = newList[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        comics.title,
                                        style: TextStyle(color: titleColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
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
    );
  }
}
