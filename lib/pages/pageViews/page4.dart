import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 150.0,
          height: 566.0,
        ),
        Center(),
        FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: () async {
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                '#A03131',
                'Cancelar',
                false,
                ScanMode.QR,
              );
              abrirUrl(barcodeScanRes);
            }),
      ],
    );
  }

  void abrirUrl(String barcodeScanRes) async =>
      await canLaunch(barcodeScanRes)
          ? await launch(barcodeScanRes)
          : throw 'Could not launch $barcodeScanRes';
}
