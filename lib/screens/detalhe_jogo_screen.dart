import 'package:flutter/material.dart';

import '../models/jogo.dart';
import 'formulario_jogo_screen.dart';

class DetalheJogoScreen extends StatelessWidget {
  final Jogo jogo;

  const DetalheJogoScreen({super.key, required this.jogo});

  Future<void> _editar(BuildContext context) async {
    final resultado = await Navigator.push<Jogo>(
      context,
      MaterialPageRoute(builder: (_) => FormularioJogoScreen(jogo: jogo)),
    );

    if (resultado != null && context.mounted) {
      Navigator.pop(context, resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do jogo'),
        actions: [
          IconButton(
            tooltip: 'Editar jogo',
            onPressed: () => _editar(context),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 48,
                          child: Icon(Icons.sports_esports, size: 48),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        jogo.titulo,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      _Informacao(
                        titulo: 'Gênero',
                        valor: jogo.genero,
                        icone: Icons.category,
                      ),
                      const SizedBox(height: 16),
                      _Informacao(
                        titulo: 'Plataforma',
                        valor: jogo.plataforma,
                        icone: Icons.devices,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Descrição',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(jogo.descricao),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Informacao extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icone;

  const _Informacao({
    required this.titulo,
    required this.valor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icone),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: Theme.of(context).textTheme.labelLarge),
              Text(valor, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
