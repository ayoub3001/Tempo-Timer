import 'package:flutter_bloc/flutter_bloc.dart';

class Temporizador extends Cubit<String> {
  // En el constructor retornamos valor por defecto "00:00:00"
  Temporizador() : super("00:00:00");

  //Declaramos variables
  //Usamos la variable isRunning para saber si ejecutar el cronómetro o no
  bool isRunning = false;
  //Estas variables las usamos para poder usarlas más adelante en el formato del contador: 00:00:00 (hours:minutes:seconds)
  int segundos = 0;
  int minutos = 0;
  int horas = 0;

  //Esta funcion se encarga de iniciar el cronómetro. Pedimos por parámetro un booleano, si es true y isRunning es false pues llamamos a la funcion _startTimer()

  // isRunning es true, !isRunning se evalúa como false, y si isRunning es false, !isRunning se evalúa como true.
  void start(bool estado) {
    if (estado && !isRunning) {
      isRunning = true;
      _startTimer();
    } else if (!estado) {
      isRunning = false;
    }
  }

  // Función asincrona para rezalizar la espera de 1 segundo
  void _startTimer() async {
    // Mientras isRunning sea true el bucle seguirá ejecutandose
    while (isRunning) {
      // Esperamos 1 segundo y luego sumamos 1 a la variable segundos
      await Future.delayed(const Duration(seconds: 1));
      segundos++;

      //Si la variable segundos es igual a 60 pues lo reseteamos a 0 y sumamos 1 a la variable minutos
      if (segundos == 60) {
        segundos = 0;
        minutos++;
        //Si la variable minutos es igual a 60 pues reseteamos a 0 y sumamos 1 a la variable horas
      } else if (minutos == 60) {
        minutos = 0;
        horas++;
      }
      //Emitimos aqui el resultado con el formato "00:00:00 (hours:minutes:seconds)"
      emit(formatTiempo(minutos: minutos, segundos: segundos, horas: horas));
    }
  }

  // Usamos esta funcion para resetear las variables y luego emitimos el resultado.
  void restart() {
    segundos = 0;
    minutos = 0;
    horas = 0;
    emit(formatTiempo(minutos: minutos, segundos: segundos, horas: horas));
  }

  //usamos esta funcion para construir el formato "00:00:00"
  String formatTiempo(
      {required int minutos, required int segundos, required int horas}) {
    //Si la variable es menor a 10 significa que sera un 0_variable:0_variable:0_variable, con lo cual ponemos manualmente el "0$variable" si es igual o mayor que 10 retornamos el valor por defecto
    String segundosStr = segundos < 10 ? '0$segundos' : '$segundos';
    String minutosStr = minutos < 10 ? '0$minutos' : '$minutos';
    String horasStr = horas < 10 ? "0$horas" : "$horas";
    return '$horasStr:$minutosStr:$segundosStr';
  }
}
