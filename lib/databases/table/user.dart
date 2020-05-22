import 'package:moor/moor.dart';

class Users extends Table{

  IntColumn get idUser => integer().autoIncrement().nullable()();

  TextColumn get eMail => text()();

  TextColumn get passWord => text()();

}