import 'dart:io';
import 'package:openid_client/openid_client.dart';

main() async {

  // print a list of known issuers
  print(Issuer.knownIssuers);

  // discover the metadata of the google OP
  var issuer = await Issuer.discover("");

  // create a client
  var client = Client(issuer, 'client_id', 'client_secret');

  // create a credential object from authorization code
  var c = client.createCredential(code: 'some received authorization code');

  // or from an access token
  c = client.createCredential(accessToken: 'some received access token');

  // or from an id token
  c = client.createCredential(idToken: 'some id token');

  // get userinfo
  var info = await c.getUserInfo();
  print(info.name);

  // get claims from id token if present
  print(c.idToken?.claims?.name);

  // create an implicit authentication flow
  var f = Flow.implicit(client);

  // or an explicit flow
  f = Flow.authorizationCode(client);

  // set the redirect uri
  f.redirectUri = Uri.parse('http://localhost');

  // do something with the authentication url
  print(f.authenticationUri);

  // handle the result and get a credential object
  c = await f.callback({
    'code': 'some code',
  });

  // validate an id token
  var violations = await c.validateToken();
}
