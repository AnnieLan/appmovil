import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/providers/ui_provider.dart';

import 'pages/home_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new UiProvider())],
      child: MaterialApp(
        title: 'Provider',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeTab(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}