import 'package:flutter/material.dart';
import 'package:tachiflu/routes/route_config.dart';

void main() {
  runApp(const Tachiflu());
}

class Tachiflu extends StatelessWidget {
  const Tachiflu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: definedRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
