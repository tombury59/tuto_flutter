import 'package:flutter/material.dart';
import 'dart:math';

class GenerateurBody extends StatefulWidget {
  const GenerateurBody({Key? key}) : super(key: key);

  @override
  State<GenerateurBody> createState() => _GenerateurBody();
}

class _GenerateurBody extends State<GenerateurBody> {
  int _counter = 0;
  int currentPageIndex = 0;
  int index = 0;
  int _valeur = 0;

  void _randomValeur() {
    setState(() {
      Random random = new Random();
      /* if (_counter == 0) {
        _valeur = 0;
      } else {*/
      _valeur = random.nextInt(10000);
      //}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 63, 224, 197),
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
        ]));
  }
}
