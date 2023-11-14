import 'package:flutter/material.dart';
import 'package:tuto_flutter/models/custom_icons_icons.dart';

class AccueilBody extends StatefulWidget {
  const AccueilBody({Key? key}) : super(key: key);

  @override
  State<AccueilBody> createState() => _AccueilBody();
}

class _AccueilBody extends State<AccueilBody> {
  int _counter = 0;
  int currentPageIndex = 0;
  int index = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 100;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= 100;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Stack(
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
                  child: Icon(CustomIcons.play),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
