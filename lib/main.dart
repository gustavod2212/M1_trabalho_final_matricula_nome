import 'package:flutter/material.dart';

import 'screens/catalogo_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CatalogoJogosApp());
}

class CatalogoJogosApp extends StatelessWidget {
  const CatalogoJogosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Catálogo de Jogos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const CatalogoScreen(),
    );
  }
}
