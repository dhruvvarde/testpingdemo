import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/screens/ping_screen.dart';

void main() {
  test('When click on button, then get the server response 5 times', () {
    final pingData = PingScreen();
    var data=pingData.controller.displayData();

    expect(data.value, '1.1.1.1');
  });
}
