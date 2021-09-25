import 'package:flutter/material.dart';
import 'package:initiative_map/ui/menu.dart';

import 'menu/about.dart';
import 'menu/feed.dart';
import 'menu/home.dart';
import 'menu/map.dart';
import 'menu/settings.dart';

void main() {
  runApp(InitiativeMapApp());
}

enum Pages {
  home,
  feed,
  map,
  about,
  settings
}

Map<Pages, String> pageTitles = {
  Pages.home: "Главная",
  Pages.feed: "Лента",
  Pages.map: "Карта",
  Pages.about: "О проекте",
  Pages.settings: "Настройки",
};

final Map<int, Color> primaryMap = {
  50: Color(0xD0275D8),
  100: Color(0x1A0275D8),
  200: Color(0x330275D8),
  300: Color(0x4D0275D8),
  400: Color(0x660275D8),
  500: Color(0x800275D8),
  600: Color(0x990275D8),
  700: Color(0xB30275D8),
  800: Color(0xCC0275D8),
  900: Color(0xE60275D8),
};

final Map<int, Color> secondaryMap = {
  50: Color(0xD7889EA),
  100: Color(0x1A7889EA),
  200: Color(0x337889EA),
  300: Color(0x4D7889EA),
  400: Color(0x667889EA),
  500: Color(0x807889EA),
  600: Color(0x997889EA),
  700: Color(0xB37889EA),
  800: Color(0xCC7889EA),
  900: Color(0xE67889EA),
};

final Map<int, Color> accentMap = {
  50: Color(0xDFF5A5A),
  100: Color(0x1AFF5A5A),
  200: Color(0x33FF5A5A),
  300: Color(0x4DFF5A5A),
  400: Color(0x66FF5A5A),
  500: Color(0x80FF5A5A),
  600: Color(0x99FF5A5A),
  700: Color(0xB3FF5A5A),
  800: Color(0xCCFF5A5A),
  900: Color(0xE6FF5A5A),
};


class ProjectColors {
  MaterialColor primary = MaterialColor(0xFF0275D8, primaryMap);
  MaterialColor secondary = MaterialColor(0xFF7889EA, secondaryMap);
  MaterialColor accent = MaterialColor(0xFFFF5A5A, accentMap);
}


class InitiativeMapApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Карта инициатив',
      theme: ThemeData(
        primarySwatch: ProjectColors().primary,
        primaryColor: ProjectColors().primary,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Pages activePage = Pages.home;
  String titlePage = pageTitles[Pages.home]!;

  @override
  Widget build(BuildContext context) {
    Widget body = HomePage();

    switch (activePage) {
      case Pages.feed:
        body = FeedPage();
        break;
      case Pages.map:
        body = MapPage();
        break;
      case Pages.about:
        body = AboutPage();
        break;
      case Pages.settings:
        body = SettingsPage();
        break;
      default:
        body = HomePage();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ProjectColors().primary, ProjectColors().secondary],
            ),
          ),
        ),
      ),
      drawer: Menu(activePage: activePage, changePage: changePage,),
      body: body,
    );
  }

  changePage(Pages page, String title) {
    setState(() => {
      activePage = page,
      titlePage = title,
      Navigator.pop(context)
    });
  }
}
