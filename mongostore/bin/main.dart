import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongostore/application_configuration.dart';
import 'package:mongostore/mongostore.dart' as mongostore;


Future<void> main(List<String> arguments) async {
  if(arguments.isEmpty) {
    throw Exception('No arguments provided, need a config file');
  }

  var config = ApplicationConfiguration(arguments.first);

  print(config);
  var db = Db('mongodb://localhost:27017/cars');

  var coll = db.collection('cars');
  await db.open();

  await coll.insertAll([
      {'constructor': 'Mini', 'model': 'Cooper'},
      {'constructor': 'Toyota', 'model': 'Yaris'}
    ]);

  await coll.find(where.eq('constructor', 'Mini'))
      .forEach((element) {print(element);});
}
