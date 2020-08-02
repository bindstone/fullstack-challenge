import 'dart:io';
import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_io.dart';

main() async {
  var uri = Uri.http('127.0.0.1:8085', '/auth/realms/dart_realm/protocol/openid-connect/auth');
  var issuer = await Issuer.discover(uri);
  var client = Client(issuer, 'dart-client');

  var scopes = List.of(['openid']);

  var authenticator = Authenticator(client,
      scopes: scopes,
      port: 4000);

  var c = await authenticator.authorize();

  return await c.getUserInfo();

}
