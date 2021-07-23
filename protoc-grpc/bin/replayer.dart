import 'package:grpc/src/server/call.dart';
import 'package:grpc/grpc.dart';
import 'package:protoc_grpc/protos/helloworld.pb.dart';
import 'package:protoc_grpc/protos/helloworld.pbgrpc.dart';

class GreaterService extends GreeterServiceBase {

  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    print('Message received : ${request.name}');
    return HelloReply()..message = "Hello ${request.name}";
  }
}

void main(List<String> arguments) async {

  final server = Server([GreaterService()]);
  await server.serve(port: 5000);
  print('Server waiting for response on : ${server.port}');

}
