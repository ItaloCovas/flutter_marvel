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
        backgroundColor: secondaryBlack.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        selectedIconTheme: const IconThemeData(color: primaryButton, size: 30),
        selectedItemColor: primaryButton,
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: comicsStore.selectedIndex,
        onTap: (index) {
          comicsStore.selectedIndex = index;
          switch (index) {
            case 0:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ComicsPage()));

              break;
            case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SeriesPage()));

              break;
            case 2:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const EventsPage()));

              break;
            case 3:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharactersPage()));

              break;

            default:
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
              ),
              title: Text(
                "Comics",
                style: TextStyle(fontFamily: 'Marvel'),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_outlined),
              title: Text(
                "Series",
                style: TextStyle(fontFamily: 'Marvel'),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              title: Text(
                "Events",
                style: TextStyle(fontFamily: 'Marvel'),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.face),
              title: Text(
                "Characters",
                style: TextStyle(fontFamily: 'Marvel'),
              )),
        ],
      );
    });
  }
}
