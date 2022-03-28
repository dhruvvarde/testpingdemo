import 'dart:io';

import 'package:dart_ping/dart_ping.dart';
import 'package:test/test.dart';
import 'package:testapp/model/server_detail_model.dart';

void main() {
  group('Pinging demo: ', () {
    test('google.com', () async {
      var ping = Ping('google.com', count: 1);
      var data = await ping.stream.first;
      expect(data, isA<ServerDetailModel>());
      expect(data.response?.time, '0:0:0.1');
    });

    test('server ip and time', () async {
      var ping = Ping('1.1.1.1', count: 1);
      var data = await ping.stream.first;
      expect(data, isA<ServerDetailModel>());
      expect(data.response?.ip, '1.1.1.1');
      expect(data.response?.time, '0:0:0.1');
    });
  });

  group('Misuse: ', () {
    test('Termination before starting', () async {
      var ping = Ping('1.1.1.1', count: 5);
      expect(ping.stop(), throwsException);
    });
  });
}
