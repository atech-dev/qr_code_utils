# qr_code_utils

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue)](https://github.com/atech-dev/qr_code_utils)

A Flutter plugin that provides tools to deal with QR Codes.

##### Package based on: [QRCodeTools](https://github.com/AifeiI/qr_code_tools/tree/master/example)

## Instalation

First, add `qr_code_utils` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

### Android

Nothing to do

### iOS

Add one rows to the `ios/Runner/Info.plist`:

* one with the key `Privacy - Photo Library Usage Description` and a usage description.

Or in text format add the key:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Can I use the photo library please?</string>
```

## Example

```dart
import 'package:qr_code_utils/qr_code_utils.dart';

String _data;
/// decode from local file
Future decode(String file) async {
  String data = await QrCodeToolsPlugin.decodeFrom(file);
  setState(() {
    _data = data;
  });
}
```

For a more elaborate usage example see [here](https://github.com/AifeiI/qr_code_tools/tree/master/example).