import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imc/result.dart';

import 'home.dart';

void main() {
  runApp(const Imc());
}

class Imc extends StatelessWidget {
  const Imc({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: "home",
            path: '/',
            builder: (context, state) => const Home(),
            routes: [
              GoRoute(
                name: "result",
                path: 'result/:resultIMC/:resultIGC',
                builder: (context, state) => ResultPage(
                  result: state.params['resultIMC']!,
                  resultIGC: state.params['resultIGC']!,
                ),
              ),
            ]),
      ],
    );
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
