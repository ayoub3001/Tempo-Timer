import 'package:flutter_bloc/flutter_bloc.dart';

class Temporizador extends Cubit<String> {
  Temporizador() : super("00:00:00");

  bool isRunning = false;
  int segundos = 0;
  int minutos = 0;
  int horas = 0;

  void start(bool estado) {
    if (estado && !isRunning) {
      isRunning = true;
      _startTimer();
    } else if (!estado) {
      isRunning = false;
    }
  }

  void _startTimer() async {
    while (isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      segundos++;

      if (segundos == 60) {
        segundos = 0;
        minutos++;
      } else if (minutos == 60) {
        minutos = 0;
        horas++;
      }
      emit(formatTiempo(minutos: minutos, segundos: segundos, horas: horas));
    }
  }

  void restart() {
    segundos = 0;
    minutos = 0;
    horas = 0;
    emit(formatTiempo(minutos: minutos, segundos: segundos, horas: horas));
  }

  String formatTiempo(
      {required int minutos, required int segundos, required int horas}) {
    String segundosStr = segundos < 10 ? '0$segundos' : '$segundos';
    String minutosStr = minutos < 10 ? '0$minutos' : '$minutos';
    String horasStr = horas < 10 ? "0$horas" : "$horas";
    return '$horasStr:$minutosStr:$segundosStr';
  }
}
