import 'dart:io';
import 'dart:convert';

void main() async {
  const int port = 8080;
  const String host = 'localhost';
  try {
    final server = await ServerSocket.bind(host, port);
    print('servidor conectado em $host:$port');

    await for (final socket in server) {
      socket.listen(
        (List<int> data) {
          final message = utf8.decode(data).trim();
          if (message.isNotEmpty) {
            if (message == "fim") {
              socket.destroy();
            } else if (message == "Cliente acabou de entrar") {
              print(message);
            } else {
              print("Temperatura recebida: $message");
            }
          }
        },

        onError: (e) {
          print("error: \n $e");
          socket.destroy();
        },
        onDone: () {
          print('Cliente acabou de Sair');
        },
      );
    }
  } catch (e) {
    print(e);
  }
}
