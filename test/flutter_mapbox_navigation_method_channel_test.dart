import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mapbox_navigation_flutter/src/flutter_mapbox_navigation_method_channel.dart';

void main() {
  final platform = MethodChannelFlutterMapboxNavigation();
  const channel = MethodChannel('mapbox_navigation_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return '42';
    });
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
