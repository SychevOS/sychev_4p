import 'package:flutter_test/flutter_test.dart';
import 'package:sychev_4p/app.dart'; // Убедитесь что этот путь правильный

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CoffeeApp()); // Должен быть CoffeeApp из app.dart

    // Verify that our app starts correctly
    expect(find.text('Меню кофейни'), findsOneWidget);
  });
}