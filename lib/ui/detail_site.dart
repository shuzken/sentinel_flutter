import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_sentinel_app/databases/app_database.dart';
import 'package:new_sentinel_app/databases/dao/barn_dao.dart';
import 'package:new_sentinel_app/helpers/routers.dart';
import 'package:provider/provider.dart';

class DetailSite extends StatefulWidget{
  final Site infoPass;
  DetailSite(this.infoPass);
  @override
  _SiteDetail createState() => _SiteDetail();}
class _SiteDetail extends State<DetailSite>{
  var formatter = new DateFormat('E, MMM dd hh:mm:ss');
  final randomNumber = Random();
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
          SizedBox(
            height: 310.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(child: Image.asset('assets/image/bg.png', fit: BoxFit.cover)),
                Positioned(
                  top: 40.0,
                  right: 10.0,
                  child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: IconButton(onPressed: null, icon: Icon(Icons.more_vert), iconSize: 24.0, color: Colors.white,)),),
                Positioned(
                  top: 40.0,
                  left: 10.0,
                  child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: IconButton(onPressed: () => Navigator.pushNamed(context, Routers.LIST_SITE), 
                  icon: Icon(Icons.arrow_back), iconSize: 24.0, color: Colors.white),),),
                Positioned(
                  bottom: 25.0,
                  left: 20.0,
                  child: Container(
                    width: 200.0,
                    height: 110.0,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.infoPass.nameSite, style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,)),
                              Text('Updated: ${formatter.format(widget.infoPass.dateSite)}', style: TextStyle(fontSize: 13.0, color: Colors.white),)
                          ],),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${widget.infoPass.totalCount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.white),),
                              Text('Total Count', style: TextStyle(fontSize: 13.0, color: Colors.white),)
                    ],)
                  ],)))
              ],
            )
          ),
          Expanded(child: buildListBarn(context)),
        ],
      )
    );
  }
  StreamBuilder<List<Barn>> buildListBarn(BuildContext context){
    final daoBarn = Provider.of<BarnDao>(context);
    final id = widget.infoPass.idSite;  
    return StreamBuilder(
      stream: daoBarn.watchBarnById(id),
      builder: (context, snapshot){
        final barn = snapshot.data?? List();
        return ListView.builder(
          itemCount: barn.length,
          itemBuilder: (_, index){
            final itemBarn = barn[index];
            return _buildRow(itemBarn, daoBarn);
        });
      },
    );
  }
  Widget _buildRow(Barn itemBarn, BarnDao daoBarn){
    return ListTile(
      leading: Image(image: AssetImage('assets/image/${randomNumber.nextInt(7)}.png')),
      title: Text(itemBarn.nameBarn ?? "", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),),
      subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Update: ${formatter.format(itemBarn.dateBarn)}', style: TextStyle(fontSize: 13.0),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children:[
                Text('Count ', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800)),
                Text('${itemBarn.numberPen?? ''}', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800, color: Colors.blue,)),
                ])
          ],
        ),
      trailing: IconButton(
          icon: Icon(Icons.chevron_right, size: 40.0,),
          onPressed: null,)
    );
  }
  
}