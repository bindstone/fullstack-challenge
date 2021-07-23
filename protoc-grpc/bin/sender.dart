import 'package:grpc/grpc.dart';
import 'package:protoc_grpc/protos/helloworld.pbgrpc.dart';

void main(List<String> arguments) async {

  final channel = ClientChannel(
    'localhost',
    port: 5000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure())
  );

  final stub = GreeterClient(channel);
  var request = HelloRequest()..name = "Dummy";
  print('Request: $request');
  var response = await stub.sayHello(request);
  print('Response: $response');

  await channel.shutdown();
}
