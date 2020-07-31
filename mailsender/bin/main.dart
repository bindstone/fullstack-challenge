import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> main(List<String> arguments) async {
  var username; //null = without authentication
  var password;
  var server = '127.0.0.1';
  var port = 1025;

  //final smtpServer = gmail(username, password);
  final smtpServer = SmtpServer(
      server, port:port, username: username, password: password, allowInsecure:true, ignoreBadCertificate:true);

  final message = Message()
    ..from = Address('dummy@news.lu', 'Your name')
    ..recipients.add('destination@example.com')
    ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
