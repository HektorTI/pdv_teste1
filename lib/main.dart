// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pdv_teste1/Theme/themes.dart';
import 'package:pdv_teste1/controller/estado_dark_light.dart';
import 'package:pdv_teste1/controller/senha_visibilidade.dart';
import 'package:pdv_teste1/screens/bemvindo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(), // Adicionando o ThemeNotifier como um provedor
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeNotifier.currentThemeMode, // Obtendo o tema do ThemeNotifier
      home: ChangeNotifierProvider(
        create: (context) => SenhaVisibilidade(),
        child: const BemVindo(),
      ),
    );
  }
}
