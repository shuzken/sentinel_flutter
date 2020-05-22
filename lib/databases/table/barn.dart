import 'package:moor/moor.dart';

class Barns extends Table{
  
  IntColumn get idBarn => integer().autoIncrement().nullable()();
  
  TextColumn get nameBarn => text()();
  
  IntColumn get numberPen => integer()();
  
  IntColumn get siteId => integer()();

  DateTimeColumn get dateBarn => dateTime()();

}