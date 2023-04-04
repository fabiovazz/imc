import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late double _currentHeightValue = 150;
  late int _currentWeightValue = 50;
  late int _currentAgeValue = 18;
  late bool _isMale = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _isMale
                ? Image.asset(
                    'images/male.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'images/female.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
            const Text("Bem Vindo"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isMale = true;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    foregroundColor: Colors.blue,
                    backgroundColor: _isMale
                        ? const Color.fromARGB(255, 210, 235, 255)
                        : Colors.white,
                    side: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  icon: const Icon(Icons.male),
                  label: const Text("Homem"),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isMale = false;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    foregroundColor: Colors.pink,
                    side: const BorderSide(color: Colors.pink, width: 1),
                    backgroundColor: _isMale
                        ? Colors.white
                        : const Color.fromARGB(255, 255, 221, 240),
                  ),
                  icon: const Icon(Icons.female),
                  label: const Text("Mulher"),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Altura"),
                Text("${_currentHeightValue.round()} cm"),
                Slider(
                  value: _currentHeightValue,
                  max: 250,
                  divisions: 250,
                  label: "${_currentHeightValue.round()}cm",
                  onChanged: (double value) {
                    setState(() {
                      _currentHeightValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("Peso"),
                    Text("$_currentWeightValue kg"),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _currentWeightValue -= 5;
                                });
                              },
                              icon: const Icon(Icons.remove)),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _currentWeightValue += 5;
                                });
                              },
                              icon: const Icon(Icons.add)),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("Idade"),
                    Text("$_currentAgeValue anos"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _currentAgeValue--;
                                });
                              },
                              icon: const Icon(Icons.remove)),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _currentAgeValue++;
                                });
                              },
                              icon: const Icon(Icons.add)),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                handleCalculateIMC();
              },
              child: const Text("Calcular"),
            )
          ],
        ),
      ),
    );
  }

  void handleCalculateIMC() {
    final double imc = _currentWeightValue / pow(_currentHeightValue / 100, 2);
    final double igc = _isMale ? 1.0 : 0.8;
    final double igcResult =
        (1.2 * imc) + (0.23 * _currentAgeValue) - (10.8 * igc) - 5.4;
    final String result = imc.toStringAsFixed(2);
    final String resultIgc = igcResult.toStringAsFixed(2);
    context.goNamed("result",
        params: {"resultIMC": result, "resultIGC": resultIgc});
  }
}
