import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:new_sentinel_app/helpers/routers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../databases/app_database.dart';
import '../databases/dao/site_dao.dart';
import '../databases/dao/barn_dao.dart';


class ListSites extends StatefulWidget {
  @override
  _ListSitesState createState() => _ListSitesState();}
class _ListSitesState extends State<ListSites>{
    var formatter = new DateFormat('E, MMM dd hh:mm:ss');
    final randomNumber = Random();
    SharedPreferences logindata;
    String eMail;
    @override
    void initState() {
      super.initState();
      getEmail();
    }
    void getEmail() async{
      logindata = await SharedPreferences.getInstance();
      setState((){eMail = logindata.getString('eMail');});
    }
    @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My Sites'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, Routers.ADD_SITE),
            child: Text('Add Site', style: TextStyle(color: Colors.red),))
        ],),
      body: buildSite(context),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(15.0),
          height: double.infinity,
          color: Colors.white,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Container(
                alignment: Alignment.center,
                child:
                Column(
                children: <Widget>[
                  Image(image: AssetImage('assets/image/sentinel-logo-300x70.png')),
                  Text('Version 0.0.3', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w100),),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text('Logged in as',  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                      Text('$eMail ', style: TextStyle(fontSize: 17.0),)
                    ],)
                  )
                ],
              ),),
              FlatButton(
                child: Text('Sign Out', style: TextStyle(fontSize: 17.0, color: Colors.red, fontWeight: FontWeight.bold,)),
                onPressed: () async{
                  await logindata.setBool('login', false);
                  Navigator.pushNamed(context, Routers.LOGIN);
                }, )
              ])
        ),),
    );
  }
  StreamBuilder<List<Site>> buildSite(BuildContext context){
    print(eMail);
    final daoSite = Provider.of<SiteDao>(context);
    final daoBarn = Provider.of<BarnDao>(context);
    if(eMail == null) return null;
    else return StreamBuilder(
      stream: daoSite.watchSite(eMail),
      builder: (context, snapshot) {
        final sites = snapshot.data?? List();
        return ListView.builder(
          itemCount: sites.length,
          itemBuilder: (_, index){
            final itemSites = sites[index];
            return buildRow(itemSites, daoSite, daoBarn, context);
          });
      },);}
  Widget buildRow(Site infoSite, SiteDao daoSite, BarnDao daoBarn, BuildContext context){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          icon: Icons.delete,
          caption: 'Delete',
          color: Colors.red,
          onTap: () async{
            await daoBarn.deleteBarnById(infoSite.idSite);
            daoSite.deleteSite(infoSite);
          }
        )
      ],
      child: ListTile(
        leading: Image(image: AssetImage('assets/image/${randomNumber.nextInt(7)}.png')),
        title: Text(infoSite.nameSite ?? "", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Update: ${formatter.format(infoSite.dateSite)}', style: TextStyle(fontSize: 13.0),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children:[
                Text('Count ', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800)),
                Text('${infoSite.totalCount?? ''}', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800, color: Colors.blue,)),
                ])
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.chevron_right, size: 40.0,),
          onPressed: () => Navigator.pushNamed(context, Routers.DETAIL_SITE, arguments: infoSite),)
      ),
    );
  }
}