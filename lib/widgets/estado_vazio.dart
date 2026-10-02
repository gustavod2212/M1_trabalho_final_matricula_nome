import 'package:flutter/material.dart';

class EstadoVazio extends StatelessWidget {
  final VoidCallback onAdicionar;

  const EstadoVazio({super.key, required this.onAdicionar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.videogame_asset_outlined,
              size: 72,
              semanticLabel: 'Nenhum jogo cadastrado',
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhum jogo cadastrado',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Adicione seu primeiro jogo ao catálogo.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onAdicionar,
              icon: const Icon(Icons.add),
              label: const Text('Adicionar jogo'),
            ),
          ],
        ),
      ),
    );
  }
}
