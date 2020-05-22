import 'package:moor/moor.dart';

class Sites extends Table{
  
  IntColumn get idSite => integer().autoIncrement().nullable()();
  
  TextColumn get nameSite => text()();

  TextColumn get address => text()();
  
  IntColumn get numberBarn => integer()();
  
  TextColumn get userEmail => text()();

  DateTimeColumn get dateSite => dateTime()();

  IntColumn get totalCount => integer()();

}