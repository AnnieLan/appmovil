import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Page3 extends StatefulWidget {
  @override
  Mypage3 createState() => Mypage3();
}

class Mypage3 extends State<Page3> {
  String valor = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 250.0),
          child: Text(
            valor,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 150.0,
          height: 300.0,
        ),
        Center(),
        FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: () async {
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  '#A03131', 'Cancelar', false, ScanMode.QR);

              print('valor de datos $barcodeScanRes');

              setState(() {
                valor = barcodeScanRes;
              });
            }),
      ],
    );
  }
}
