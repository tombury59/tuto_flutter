import 'package:flutter/material.dart';

import 'Accueil.dart';
import 'Generateur.dart';
import 'Parametre.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
          secondary: Colors.deepOrange,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      home: const NavBarState(title: 'Page Facebook de Jean L'),
    );
  }
}

class NavBarState extends StatefulWidget {
  const NavBarState({Key? key, required this.title});

  final String title;

  @override
  State<NavBarState> createState() => _NavBarState();
}

class _NavBarState extends State<NavBarState> {
  int currentPageIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new AccueilBody();
      case 1:
        return new GenerateurBody();
      case 2:
        return new ParamBody();

      default:
        return const Text('Erreur de page');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(widget.title),
        ),
        Expanded(
          child: Scaffold(
            body: _getDrawerItemWidget(currentPageIndex),
          ),
        ),
        BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Générateur',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Parametre',
            ),
          ],
        ),
      ],
    );
  }
}
