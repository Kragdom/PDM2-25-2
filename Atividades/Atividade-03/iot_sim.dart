import 'dart:io';
import 'dart:async';
import 'dart:math';

void main() async {
  const int port = 8080;
  const host = 'localhost';
  String message = "Cliente acabou de entrar";

  try {
    final socket = await Socket.connect(host, port);
    int timer = Random().nextInt(10) * 10;
    socket.write(message);
    while (timer > 0) {
      double temperatura = Random().nextInt(36) * Random().nextDouble();

      message = '${temperatura.toStringAsFixed(1)} °C ';
      socket.write(message);
      socket.flush();
      await Future.delayed(Duration(seconds: 10));
      timer -= 10;
      print("tempo restante: $timer");
    }
    message = "fim";
    socket.write(message);
    socket.destroy();
  } catch (e) {
    print(e);
  }
}
