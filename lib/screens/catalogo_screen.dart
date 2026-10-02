import 'package:flutter/material.dart';

import '../models/jogo.dart';
import '../widgets/estado_vazio.dart';
import '../widgets/jogo_card.dart';
import 'detalhe_jogo_screen.dart';
import 'formulario_jogo_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Jogo> _jogos = [];

  Future<void> _adicionarJogo() async {
    final resultado = await Navigator.push<Jogo>(
      context,
      MaterialPageRoute(builder: (_) => const FormularioJogoScreen()),
    );

    if (resultado == null) {
      return;
    }

    setState(() {
      _jogos.add(resultado);
    });

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Jogo adicionado ao catálogo.')),
    );
  }

  Future<void> _abrirDetalhes(Jogo jogo) async {
    final resultado = await Navigator.push<Jogo>(
      context,
      MaterialPageRoute(builder: (_) => DetalheJogoScreen(jogo: jogo)),
    );

    if (resultado == null) {
      return;
    }

    setState(() {
      final indice = _jogos.indexWhere((item) => item.id == resultado.id);

      if (indice != -1) {
        _jogos[indice] = resultado;
      }
    });

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Jogo atualizado com sucesso.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Catálogo de Jogos')),
      body: SafeArea(
        child: _jogos.isEmpty
            ? EstadoVazio(onAdicionar: _adicionarJogo)
            : LayoutBuilder(
                builder: (context, constraints) {
                  final largura = constraints.maxWidth;

                  final colunas = largura >= 900
                      ? 3
                      : largura >= 600
                      ? 2
                      : 1;

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: colunas,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: largura >= 600 ? 2.2 : 2.5,
                    ),
                    itemCount: _jogos.length,
                    itemBuilder: (context, index) {
                      final jogo = _jogos[index];

                      return JogoCard(
                        jogo: jogo,
                        onTap: () => _abrirDetalhes(jogo),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _adicionarJogo,
        tooltip: 'Adicionar jogo',
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
    );
  }
}
