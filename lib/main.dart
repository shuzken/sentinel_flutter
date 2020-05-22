import 'package:flutter/material.dart';
import 'package:new_sentinel_app/databases/app_database.dart';
import 'package:provider/provider.dart';

import 'helpers/routers.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final db= AppDatabase();
    return MultiProvider(
      providers: [
        Provider(create: (_) => db.userDao),
        Provider(create: (_) => db.barnDao),
        Provider(create: (_) => db.siteDao),
      ],
      child: MaterialApp(
        onGenerateRoute: Routers.generateRoute,
        initialRoute: Routers.LOGIN,
      ),
    );
  }
}