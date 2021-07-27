import 'dart:io';
import 'dart:isolate';
import 'dart:async';

void notifyFunction(SendPort sendPort) {
  int counter = 0;
  ReceivePort receivePort = ReceivePort();
  receivePort.listen((message) {
    print('--> $message');
  });
  sendPort.send(receivePort.sendPort);

  Timer.periodic(const Duration(seconds: 3), (_) {
    counter++;

    String sendMsg = "Counter: $counter";
    print("${DateTime.now()} Notify : $counter");
    sendPort.send(sendMsg);

  });
}

void main() async {

  final receiver = ReceivePort();
  SendPort? rtn;
  receiver.listen((message) {
    if (message.runtimeType != String) {
      rtn = message;
    } else {
      print(message);
      if(rtn != null) {
        rtn!.send("AKN");
      }
    }
  });

  Isolate isolate = await Isolate.spawn(notifyFunction, receiver.sendPort);
}