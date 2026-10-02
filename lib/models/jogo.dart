class Jogo {
  final int id;
  final String titulo;
  final String genero;
  final String plataforma;
  final String descricao;

  Jogo({
    required this.id,
    required this.titulo,
    required this.genero,
    required this.plataforma,
    required this.descricao,
  });

  Jogo copyWith({
    int? id,
    String? titulo,
    String? genero,
    String? plataforma,
    String? descricao,
  }) {
    return Jogo(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      genero: genero ?? this.genero,
      plataforma: plataforma ?? this.plataforma,
      descricao: descricao ?? this.descricao,
    );
  }
}
