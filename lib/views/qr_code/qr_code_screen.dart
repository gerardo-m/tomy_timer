import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScreen extends StatelessWidget{
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QrCode r'),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).width,
        width: MediaQuery.sizeOf(context).width,
        child: MobileScanner(
          onDetect: (barcodes) {
            Uint8List? data = barcodes.barcodes[0].rawBytes;
            List<int> decodedData = GZipCodec().decode(data?.toList() ?? []);
            String fullData = utf8.decode(decodedData);
            Navigator.of(context).pop(fullData);
          },
          onDetectError: (error, stackTrace) => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
  