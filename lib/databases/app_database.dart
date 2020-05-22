import 'dart:io';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'dao/barn_dao.dart';
import 'dao/site_dao.dart';
import 'dao/user_dao.dart';
import 'table/barn.dart';
import 'table/site.dart';
import 'table/user.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dataFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dataFolder.path, 'db1.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
  tables: [Users, Sites, Barns],
  daos: [UserDao, SiteDao, BarnDao])
class AppDatabase extends _$AppDatabase{
  AppDatabase(): super(_openConnection());
  
  static AppDatabase _instance;
  static AppDatabase instance(){
    if(_instance == null) _instance = AppDatabase();
    return _instance;
  }

  @override
  int get schemaVersion => 5;
}