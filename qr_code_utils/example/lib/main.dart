import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_utils/qr_code_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _decoded = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    var imagePicker = ImagePicker();

    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (xfile != null) {
      String? decoded;
      // Platform messages may fail, so we use a try/catch PlatformException.
      // We also handle the message potentially returning null.
      try {
        decoded = await QrCodeUtils.decodeFrom(xfile.path) ??
            'Unknown platform version';
        if (decoded != null) {
          _decoded = decoded;
        }
      } on PlatformException {
        _decoded = 'Failed to get decoded.';
      }
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  initPlatformState();
                },
                child: Text("Ler QR code"),
              ),
              const SizedBox(height: 40),
              Text('Running on: $_decoded\n'),
            ],
          ),
        ),
      ),
    );
  }
}
