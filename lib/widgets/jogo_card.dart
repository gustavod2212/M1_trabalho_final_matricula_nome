import 'package:flutter/material.dart';

import '../models/jogo.dart';

class JogoCard extends StatelessWidget {
  final Jogo jogo;
  final VoidCallback onTap;

  const JogoCard({super.key, required this.jogo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Semantics(
                label: 'Ícone do jogo ${jogo.titulo}',
                child: const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.sports_esports),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jogo.titulo,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(jogo.genero),
                    const SizedBox(height: 2),
                    Text(
                      jogo.plataforma,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
