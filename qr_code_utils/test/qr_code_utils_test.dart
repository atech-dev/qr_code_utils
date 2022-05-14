import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_utils/qr_code_utils.dart';

void main() {
  const MethodChannel channel = MethodChannel('qr_code_utils');

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
    expect(await QrCodeUtils.decodeFrom(""), '42');
  });
}
