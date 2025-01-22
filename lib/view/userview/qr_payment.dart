import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrPayment extends StatefulWidget {
  const QrPayment({super.key});

  @override
  State<QrPayment> createState() => _QrPaymentState();
}

class _QrPaymentState extends State<QrPayment> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isflashClick = false;
  Barcode? result;
  QRViewController? _qrViewController;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController!.resumeCamera();
    }
    super.reassemble();
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Expanded(flex: 4, child: _buildQrView(context)),
        Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  if (result != null) Text('BarCode Type  ${result!.code}'),
                  if (result == null) Text('Scan a Code'),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () async {
                          await _qrViewController?.flipCamera();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: _qrViewController?.getCameraInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Text('Flip Camera');
                            } else {
                              return const Text('Flip Camera');
                            }
                          },
                        )),
                  ),
                ],
              ),
            ))
      ])),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 400.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: qRViewCreate,
      overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void qRViewCreate(QRViewController controller) {
    _qrViewController = controller;
    controller.scannedDataStream.listen(((scanData) {
      setState(() {
        result = scanData;
      });
    }));
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
