import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/presentation/blocs/qr_bloc/qr_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QrBloc(),
        child: BlocConsumer<QrBloc, QrState>(
          listener: (context, state) {
            if (state is Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).error)),
              );
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Success) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '${state.result.code}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              var scanArea = (MediaQuery.of(context).size.width < 400 ||
                      MediaQuery.of(context).size.height < 400)
                  ? 150.0
                  : 300.0;
              return QRView(
                key: GlobalKey(debugLabel: S.of(context).qr),
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((scanData) {
                    context.read<QrBloc>().add(ScanEvent(scanData));
                  });
                },
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.orange,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea,
                ),
                onPermissionSet: (ctrl, p) =>
                    _onPermissionSet(context, ctrl, p),
              );
            }
          },
        ),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).noPermission),
        ),
      );
    }
  }
}
