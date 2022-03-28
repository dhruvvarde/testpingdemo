import 'package:dart_ping/dart_ping.dart';
import 'package:get/get.dart';
import '../controller/base.dart';
import '../model/server_detail_model.dart';

class PingController extends BaseController {
  List<ServerDetailModel> serverDetails = <ServerDetailModel>[].obs;
  List<Duration> total = <Duration>[];
  Duration times = const Duration();

  @override
  void errorHandler(e) {}

  displayData() {
    serverDetails.clear();
    final ping = Ping('google.com', count: 5);
    ping.stream.listen((event) {
      if (event.response != null) {
        ServerDetailModel model = ServerDetailModel(
          ipAddress: event.response!.ip,
          serverTime: event.response!.time,
        );
        serverDetails.add(model);
        times = times + event.response!.time!;
        total.add(times);
        print("Added Array " + total.toString());
        print(event.response);
      }
    });
  }
}
