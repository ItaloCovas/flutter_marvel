import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/comics_store.dart';
import 'package:flutter_marvel/pages/characters_page.dart';
import 'package:flutter_marvel/pages/comics_page.dart';
import 'package:flutter_marvel/pages/events_page.dart';
import 'package:flutter_marvel/pages/series_page.dart';

import 'package:flutter_marvel/themes/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
  }) : super(key: key);

  final comicsStore = GetIt.I.get<ComicsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        backgroundColor: backgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        selectedIconTheme: const IconThemeData(color: primaryButton, size: 30),
        selectedItemColor: primaryButton,
        unselectedItemColor: titleColor,
        currentIndex: comicsStore.selectedIndex,
        onTap: (index) {
          comicsStore.selectedIndex = index;
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ComicsPage()));

              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SeriesPage()));

              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharactersPage()));

              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EventsPage()));

              break;

            default:
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
                size: 16,
              ),
              label: "Comics"),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_outlined, size: 20), label: "Series"),
          BottomNavigationBarItem(
            icon: Icon(Icons.face, size: 16),
            label: "Characters",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, size: 16),
            label: "Events",
          ),
        ],
      );
    });
  }
}
