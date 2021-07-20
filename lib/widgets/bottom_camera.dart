import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BottomCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(child: Icon(Icons.camera), onPressed: () async {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#A03131', 'Cancelar', false, ScanMode.QR);

          print(barcodeScanRes);
    });
  }
}