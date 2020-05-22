import 'package:moor/moor.dart';

import '../table/barn.dart';
import '../app_database.dart';
part 'barn_dao.g.dart';

@UseDao(tables: [Barns])
class BarnDao extends DatabaseAccessor<AppDatabase> with _$BarnDaoMixin{
  final AppDatabase db;

  BarnDao(this.db): super(db);

  Stream<List<Barn>> watchBarnById(int id) => (select(barns)..where((tbl) => tbl.siteId.equals(id))).watch();

  Future insertBarn(barn) => into(barns).insert(barn);

  Future getBarnById(int id) => (select(barns)..where((tbl) => tbl.siteId.equals(id))).get();

  Future deleteBarnById(int id) => (delete(barns)..where((tbl) => tbl.siteId.equals(id))).go();
  Future deleteAll() => delete(barns).go();

}