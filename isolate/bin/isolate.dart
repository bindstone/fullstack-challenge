import 'dart:io';
import 'dart:isolate';
import 'dart:async';

void notifyFunction(SendPort sendPort) {
  int counter = 0;

  Timer.periodic(const Duration(seconds: 3), (_) {
    counter++;

    String sendMsg = "Counter: $counter";
    print("${DateTime.now()} Notify : $counter");
    sendPort.send(sendMsg);
  });
}

void main() async {

  final receiver = ReceivePort();
  receiver.listen((message) {
    print(message);
  });

  Isolate isolate = await Isolate.spawn(notifyFunction, receiver.sendPort);

}