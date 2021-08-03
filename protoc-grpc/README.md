https://developers.google.com/protocol-buffers/docs/darttutorial

https://grpc.io/docs/languages/dart/quickstart/


Install 

brew tap homebrew/versions

brew install protobuf

protoc --version

protoc --dart_out=grpc:./lib/protos -Iprotos protos/helloworld.proto

ATTENTION: With Flutter grpc need a proxy, read:
https://grpc.io/blog/state-of-grpc-web/