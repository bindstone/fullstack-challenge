https://developers.google.com/protocol-buffers/docs/darttutorial

https://grpc.io/docs/languages/dart/quickstart/


Install 

brew tap homebrew/versions

brew install protobuf

protoc --version

protoc --dart_out=grpc:./lib/protos -Iprotos protos/helloworld.proto
