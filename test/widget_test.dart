import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testapp/controller/ping_controller.dart';
import 'package:testapp/main.dart';
import 'package:testapp/model/server_detail_model.dart';
import 'package:testapp/screens/widgets/widget.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  testWidgets('Get 5 time response on button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var button = find.text("Click");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.tap(find.byType(CustomTextButton));
    await tester.pump();
  });
}

class PingScreen extends GetView<PingController> {
  static const pageId = "/PingScreen";
  Duration times = const Duration();

  PingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              CustomTextButton(
                title: "Click",
                onCallback: displayData,
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayData() {
    final ping = Ping('google.com', count: 5);
    ping.stream.listen((event) {
      ServerDetailModel model =
      ServerDetailModel(ipAddress:  event.response!.ip, serverTime:  event.response!.time);
      controller.serverDetails.add(model);
      times = times + event.response!.time!;
      controller.total.add(times);
      print('response: ${event.response}' );
    });
  }
}
