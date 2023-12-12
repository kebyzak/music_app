// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_state.dart';
part 'qr_event.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(Initial()) {
    on<ScanEvent>((event, state) async {
      emit(Loading());
      try {
        emit(Success(event.result));
      } catch (e) {
        emit(Error());
      }
    });
  }
}
