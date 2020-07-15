import 'package:postgres/postgres.dart';
import 'package:postgresstore/postgresstore.dart' as postgresstore;

// jdbc:postgresql://localhost:5432/postgres
Future<void> main(List<String> arguments) async {
  var connection = PostgreSQLConnection('localhost', 5432, 'docker', username: 'postgres', password: 'docker');
  await connection.open();

  List<List<dynamic>> results = await connection.query('SELECT firstName, lastName FROM persons');

  for (final row in results) {
    var a = row[0];
    var b = row[1];
    print ('${a}:${b}');
  }

  print ('END.');
}
