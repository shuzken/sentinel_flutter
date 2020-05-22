import 'package:moor/moor.dart';

import '../table/user.dart';
import '../app_database.dart';
part 'user_dao.g.dart';

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin{
  final AppDatabase db;

  UserDao(this.db): super(db);

  Stream<List<User>> watchUser() => select(users).watch();
  Future<List<User>> getUser() => select(users).get();

  Future insertUser(user) => into(users).insert(user);

  Future deleteAll() => delete(users).go();

}