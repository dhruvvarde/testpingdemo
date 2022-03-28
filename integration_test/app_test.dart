import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testapp/main.dart';
import 'package:testapp/screens/widgets/custom_text_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  testWidgets('When click on button, then get the server response 5 times', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var button = find.text("Click");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.tap(find.byType(CustomTextButton));
    await tester.pump();
  });
}
