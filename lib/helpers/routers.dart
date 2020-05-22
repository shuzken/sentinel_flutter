import 'package:flutter/material.dart';
import 'package:new_sentinel_app/ui/add_new_site.dart';
import 'package:new_sentinel_app/ui/detail_site.dart';
import 'package:new_sentinel_app/ui/list_sites.dart';
import 'package:new_sentinel_app/ui/login_page.dart';
import 'package:new_sentinel_app/ui/settup_barn.dart';
import 'package:new_sentinel_app/ui/sign_up.dart';

class Routers{
  static const String LOGIN = '/';
  static const String LIST_SITE = '/listsite';
  static const String DETAIL_SITE = '/listsite/sitedetails';
  static const String SIGN_UP = '/signup';
  static const String ADD_SITE = '/listsite/addnewsite';
  static const String SETTUP_BARN = '/listsite/addnewsite/settupbarn';

  static Route<dynamic> generateRoute(RouteSettings settings){
    var data = settings.arguments;
    switch (settings.name){
      case LOGIN:
        return _animRoute(LoginPage());
      case LIST_SITE:
        return _animRoute(ListSites());
      case DETAIL_SITE:
        return MaterialPageRoute(builder: (_) => DetailSite(data));
      case SIGN_UP:
        return _animRoute(SignUp());
      case ADD_SITE:
        return _animRoute(AddNewSite());
      case SETTUP_BARN:
       return MaterialPageRoute(builder: (_) => SettupBarn(data));
      default:
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
    }
  }

  static Route _animRoute(Widget page, {Offset beginOffset}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve =Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
    );
  }
  
}