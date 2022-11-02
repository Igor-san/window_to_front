import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:window_to_front/window_to_front_method_channel.dart';

void main() {
  MethodChannelWindowToFront platform = MethodChannelWindowToFront();
  const MethodChannel channel = MethodChannel('window_to_front');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
