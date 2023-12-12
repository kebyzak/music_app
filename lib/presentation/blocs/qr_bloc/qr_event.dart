part of 'qr_bloc.dart';

abstract class QrEvent {}

class ScanEvent extends QrEvent {
  final Barcode result;

  ScanEvent(this.result);
}
