import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 39, 5, 131)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Page Facebook de Jean L'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 0;
  int index = 0;
  int _valeur = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 10;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= 10;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _randomValeur() {
    setState(() {
      Random random = new Random();
      _valeur = random.nextInt(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: <Widget>[
        Container(
          child: ListView(
            children: <Widget>[
              Image.asset(
                'images/logo_facebook.png',
                width: 100,
                height: 100,
              ),
              Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Jean_Lassalle_04_%28cropped%29.jpg/1200px-Jean_Lassalle_04_%28cropped%29.jpg",
                  width: 150,
                  height: 150),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Nombres de Follower",
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: ListView(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '$_valeur',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 0, 0, 0)),
                ),
                onPressed: () => {_randomValeur()},
                child: const Text('Générer un nombre aléatoire'),
              )
            ])),
        Container(
          color: Color.fromARGB(255, 50, 34, 190),
          alignment: Alignment.center,
          child: const Text("Parametre"),
        ),
      ][currentPageIndex],
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                child: Icon(Icons.arrow_circle_down),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.arrow_circle_up),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: _resetCounter,
              child: Icon(Icons.auto_fix_normal),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          }); // Adjust the color as needed.
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.apps),
            label: 'Générateur',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: 'Parametre',
          ),
        ],
      ),
    );
  }
}
