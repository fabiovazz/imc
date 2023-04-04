import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String resultIGC;
  const ResultPage({super.key, required this.result, required this.resultIGC});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Seu IMC é de: $result"),
          Text("Seu IGC é de: $resultIGC"),
        ]),
      ),
    );
  }
}
