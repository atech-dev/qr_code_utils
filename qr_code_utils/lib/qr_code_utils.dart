import 'dart:async';

import 'package:flutter/services.dart';

class QrCodeUtils {
  static const MethodChannel _channel =
      MethodChannel('dev.atech/qr_code_utils');

  static Future<String?> decodeFrom(String filePath) async {
    final String? data =
        await _channel.invokeMethod('decoder', {'file': filePath});
    return data;
  }
}
