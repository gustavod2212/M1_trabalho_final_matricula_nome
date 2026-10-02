import 'package:flutter_test/flutter_test.dart';

import 'package:m1_trabalho_final_matricula_nome/main.dart';

void main() {
  testWidgets('exibe estado vazio ao iniciar o catálogo', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CatalogoJogosApp());

    expect(find.text('Nenhum jogo cadastrado'), findsOneWidget);

    expect(find.text('Adicionar jogo'), findsOneWidget);
  });
}
