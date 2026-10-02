import 'package:flutter/material.dart';

import '../models/jogo.dart';

class FormularioJogoScreen extends StatefulWidget {
  final Jogo? jogo;

  const FormularioJogoScreen({super.key, this.jogo});

  @override
  State<FormularioJogoScreen> createState() => _FormularioJogoScreenState();
}

class _FormularioJogoScreenState extends State<FormularioJogoScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _tituloController;
  late final TextEditingController _generoController;
  late final TextEditingController _plataformaController;
  late final TextEditingController _descricaoController;

  bool _submetendo = false;

  bool get _editando => widget.jogo != null;

  @override
  void initState() {
    super.initState();

    _tituloController = TextEditingController(text: widget.jogo?.titulo ?? '');

    _generoController = TextEditingController(text: widget.jogo?.genero ?? '');

    _plataformaController = TextEditingController(
      text: widget.jogo?.plataforma ?? '',
    );

    _descricaoController = TextEditingController(
      text: widget.jogo?.descricao ?? '',
    );
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _generoController.dispose();
    _plataformaController.dispose();
    _descricaoController.dispose();

    super.dispose();
  }

  String _normalizar(String valor) {
    return valor.trim();
  }

  String? _validarTitulo(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Informe o título.';
    }

    if (valor.trim().length < 2) {
      return 'O título deve possuir pelo menos 2 caracteres.';
    }

    return null;
  }

  String? _validarCampo(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Este campo é obrigatório.';
    }

    return null;
  }

  void _salvar() {
    if (_submetendo) {
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _submetendo = true;
    });

    final jogo = Jogo(
      id: widget.jogo?.id ?? DateTime.now().millisecondsSinceEpoch,
      titulo: _normalizar(_tituloController.text),
      genero: _normalizar(_generoController.text),
      plataforma: _normalizar(_plataformaController.text),
      descricao: _normalizar(_descricaoController.text),
    );

    Navigator.pop(context, jogo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_editando ? 'Editar jogo' : 'Novo jogo')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _tituloController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Título',
                        hintText: 'Ex.: The Witcher 3',
                        prefixIcon: Icon(Icons.title),
                      ),
                      validator: _validarTitulo,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _generoController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Gênero',
                        hintText: 'Ex.: RPG',
                        prefixIcon: Icon(Icons.category),
                      ),
                      validator: _validarCampo,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _plataformaController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Plataforma',
                        hintText: 'Ex.: PC',
                        prefixIcon: Icon(Icons.devices),
                      ),
                      validator: _validarCampo,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descricaoController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        hintText: 'Digite uma breve descrição...',
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.description),
                      ),
                      validator: _validarCampo,
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: _submetendo ? null : _salvar,
                      icon: const Icon(Icons.save),
                      label: Text(
                        _editando ? 'Salvar alterações' : 'Cadastrar jogo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
