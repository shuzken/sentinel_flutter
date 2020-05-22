import 'package:moor/moor.dart';

import '../table/site.dart';
import '../app_database.dart';
part 'site_dao.g.dart';

@UseDao(tables: [Sites])
class SiteDao extends DatabaseAccessor<AppDatabase> with _$SiteDaoMixin{
  final AppDatabase db;

  SiteDao(this.db): super(db);

  Stream<List<Site>> watchSite(String eMail) => (select(sites)..where((tbl) => tbl.userEmail.equals(eMail))).watch();

  Future insertSite(site) => into(sites).insert(site);

  Future deleteSite(site) => delete(sites).delete(site);
  Future deleteAll() => delete(sites).go();

}