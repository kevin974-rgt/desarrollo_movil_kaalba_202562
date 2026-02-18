import 'package:flutter_test/flutter_test.dart';
import 'package:desarrollo_movil_kaalba_202562/main.dart';

void main() {
  testWidgets('Carga pantalla login correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verificamos que aparezca el texto Login
    expect(find.text('Login'), findsOneWidget);
  });
}
