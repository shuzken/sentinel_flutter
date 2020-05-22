import 'package:flutter/material.dart';
import 'package:new_sentinel_app/helpers/routers.dart';
import 'package:new_sentinel_app/ui/add_new_site.dart';
import 'package:provider/provider.dart';

import '../databases/app_database.dart';
import '../databases/dao/site_dao.dart';
import '../databases/dao/barn_dao.dart';

class SettupBarn extends StatefulWidget{
  final PassInfoSite infoPass;
  SettupBarn(this.infoPass);
  @override
  _SettupBarnState createState() => _SettupBarnState();
}

class _SettupBarnState extends State<SettupBarn>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context){
    final List<String> nameBarn = List(widget.infoPass.numberBarn);
    final List<int> numberPen = List(widget.infoPass.numberBarn);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Settup Barn'),),
          actions: <Widget>[
            FlatButton(
              child: Text('Done', style: TextStyle(color: Colors.red),),
              onPressed: () async{                
                await valiInput();
                if(_autoValidate == false){
                  final daoSite = Provider.of<SiteDao>(context);
                  final daoBarn = Provider.of<BarnDao>(context);
                  final count = numberPen.reduce((a, b) => a + b);
                  final site = Site(
                    nameSite: widget.infoPass.nameSite,
                    address: widget.infoPass.address,
                    numberBarn: widget.infoPass.numberBarn,
                    userEmail: widget.infoPass.userEmail,
                    dateSite: widget.infoPass.dateSite,
                    totalCount: count,
                  );
                  print(site);
                  int id = await daoSite.insertSite(site);
                  for(int i = 0; i < widget.infoPass.numberBarn; i++){ 
                    await daoBarn.insertBarn(
                      Barn(
                        nameBarn: nameBarn[i],
                        numberPen: numberPen[i],
                        siteId: id,
                        dateBarn: DateTime.now(),
                      ));
                    print('Inserted Barn with Name: ${nameBarn[i]}, Pens: ${numberPen[i]} and Id: $id');}
                  Navigator.pushNamed(context, Routers.LIST_SITE);
                }
              }, )
          ],
        ),
        body: Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child:
        ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: widget.infoPass.numberBarn*2,
        itemBuilder: (BuildContext context, int i){
          if(i.isOdd) return Divider();
          final index = i~/2+1 ;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Expanded(
              child: SizedBox(
                width: 40.0,
                child: TextFormField(
                  validator: (String agr) {
                    if(agr.length < 1) return 'Can\'t be blank'; else return null;
                  },
                  onSaved: (String val){ nameBarn[index - 1] = val;},
                  decoration: InputDecoration(
                    hintText: 'Barn $index',
                    labelText: 'Barn $index Name'),),
              )),
            Expanded(
              child: SizedBox(
                width: 40.0,
                child: Directionality(
                  textDirection: TextDirection.rtl, 
                  child: TextFormField(
                  validator: (String agr) {
                    if(agr.length < 1) return 'Can\'t be blank'; else return null; 
                  },
                  onSaved: (String val){ numberPen[index - 1] = int.parse(val);},
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: '1',
                    labelText: 'Number of Pens'),),)
              ))
        ],);
        }
      ),
    ));    
  }  
  Future valiInput() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      setState(() {
        _autoValidate = false;
      });
    }
    else{
      setState(() {
        _autoValidate = true;
      });
    }
  }
}