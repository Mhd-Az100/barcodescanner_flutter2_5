import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScane extends StatefulWidget {
  @override
  _BarcodeScaneState createState() => _BarcodeScaneState();
}

class _BarcodeScaneState extends State<BarcodeScane> {
  String _scanBarcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('barcode'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcodeNormal,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text("result : $_scanBarcode"),
      ),
    );
    ;
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
}
