import 'package:flutter/material.dart';
import 'package:new_sentinel_app/helpers/routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewSite extends StatefulWidget{
  @override 
  _AddNewSiteState createState() => _AddNewSiteState();
}
class _AddNewSiteState extends State<AddNewSite>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _siteName;
  String _siteAddress;
  int _numberBarn;
  SharedPreferences logindata;
  String eMail;
  @override
    void initState() {
      super.initState();
      getEmail();
    }
    void getEmail() async{
      logindata = await SharedPreferences.getInstance();
      eMail = logindata.getString('eMail');
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pushNamed(context, Routers.LIST_SITE),),
        title: Text('Add New Site'),
        actions: <Widget>[
          FlatButton( 
          child: Text('Next', style: TextStyle(color: Colors.red),),
          onPressed: () async{
            await valiInput();
            final infoPass = PassInfoSite(
              address: _siteAddress, 
              nameSite: _siteName,
              userEmail: eMail,
              numberBarn: _numberBarn,
              dateSite: DateTime.now());
            if(_autoValidate == true) return null; else{
              print(infoPass.numberBarn);
              Navigator.pushNamed(context, Routers.SETTUP_BARN, 
              arguments: infoPass);}
            },)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Column(
              children:[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Site Name'),
                  validator: (String arg){
                    if(arg.length < 1) return 'Can\'t be blank'; else return null;
                  },
                  onSaved: (String siteName){
                    this._siteName = siteName;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Site Address'),
                  validator: (String arg){
                    if(arg.length < 1) return 'Can\'t be blank'; else return null;
                  },
                  onSaved: (String val){
                    this._siteAddress = val;
                  },
                ),
                TextFormField(
                  validator: (String arg){
                    if(arg.length < 1) return 'Can\'t be blank'; else return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Number of Barn'),
                  onSaved: (var val){
                    this._numberBarn = int.parse(val);
                  },
                ),
              ]
            ),
          ),
        ),
      )
    );
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
@immutable
class PassInfoSite{
    final String nameSite;
    final String address;
    final int numberBarn;
    final String userEmail;
    final DateTime dateSite; 
  PassInfoSite({this.nameSite, this.address, this.numberBarn, this.userEmail, this.dateSite});
}
