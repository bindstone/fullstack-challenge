import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongostore/application_configuration.dart';
import 'package:mongostore/mongostore.dart' as mongostore;


void main(List<String> arguments) {
  if(arguments.isEmpty) {
    throw Exception('No arguments provided, need a config file');
  }

  var config = ApplicationConfiguration(arguments.first);

  print(config);
  var db = Db('mongodb://localhost:27017/mongo_dart-blog');



}
