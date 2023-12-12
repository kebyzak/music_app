part of 'qr_bloc.dart';

abstract class QrState {}

class Initial extends QrState {}

class Loading extends QrState {}

class Success extends QrState {
  final Barcode result;

  Success(this.result);
}

class Error extends QrState {}
