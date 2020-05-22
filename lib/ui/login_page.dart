import 'package:flutter/material.dart';
import 'package:new_sentinel_app/helpers/routers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../databases/app_database.dart';
import '../databases/dao/user_dao.dart';


class LoginPage extends StatefulWidget{
  @override
  _HomeLoginState createState() => _HomeLoginState();
}
class _HomeLoginState extends State<LoginPage>{
  SharedPreferences logindata;
  bool userlogin;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _logIn = false;
  bool _autoValidate = false;
  String _eMail;
  String _passWord;
  bool _eyeclosed = true;
  @override
  void initState(){
    super.initState();
    checkLogin();
  }
  void checkLogin() async{
    logindata = await SharedPreferences.getInstance();
    userlogin = (logindata.getBool('login')?? false);
    print(userlogin);
    if(userlogin == true){
      Navigator.pushNamed(context, Routers.LIST_SITE);
    }
  }
  @override
  Widget build(BuildContext context){
    final daoUser = Provider.of<UserDao>(context);
    return StreamBuilder<List<User>>(
      stream: daoUser.watchUser(),
      builder: (context, snapshot){
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(1, 0, 32, 87), 
              Color.fromARGB(1, 0, 60, 162)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Image(image: AssetImage('assets/image/sentinel-logo.png')),
                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),),
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Welcome back', style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w500),),
                        
                        Text('Login your account', style: TextStyle(fontSize: 17.0, fontFamily: "SF UI Dislay"),),
                        
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder()),
                          validator: (String eMail) {
                            Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if(!regex.hasMatch(eMail)) return 'Enter the right Email address'; else return null;},
                          onSaved: (String val){ this._eMail = val;},),
                        
                        TextFormField(
                          obscureText: this._eyeclosed,
                          validator: (String passWords) {
                            RegExp regex = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
                            if(!regex.hasMatch(passWords)) return 'Least 6 characters, have both'; else return null;},
                          decoration: InputDecoration(
                            hintText:'PassWord',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(icon: Icon(this._eyeclosed? Icons.visibility_off:Icons.visibility, color: Colors.blueAccent,), onPressed:(){setState(() => this._eyeclosed = !this._eyeclosed);} ),),
                          onSaved: (String val){this._passWord = val;},),
                        
                        RaisedButton(
                          onPressed: () async{
                            await valiInput();
                            await logIn(snapshot);
                            checkInfoUser();
                            },
                          color: Colors.blue, 
                          child: Text('Sign in')),
                        
                        FlatButton(onPressed: null, child: Text('Forgot your password?')),
                ],
              ),
            )
           )
        ],)
        )
      );
    });  
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
  Future<void> logIn(AsyncSnapshot<List<User>> snapshot) async {
    print('${snapshot.toString()}');
    final users =  snapshot.data?? List();
    for(int i = 0; i < users.length; i++){
        if(users[i].eMail == _eMail && users[i].passWord == _passWord) { setState(() {
        _logIn = true;});} }
  }
  void checkInfoUser() {
    if(_autoValidate == false) {
      if (_logIn == true){
        logindata.setBool('login', true);
        logindata.setString('eMail', _eMail);
        Navigator.pushNamed(context, Routers.LIST_SITE);}
      if(_logIn == false){
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Center(child: Text('Login Faild', style: TextStyle(fontSize: 28.0, color: Colors.red),),),
            content: Text('Your Email or Password was wrong!'),
            actions: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(onPressed: null, child: Text('Forgot your password?')),
                  FlatButton(
                    onPressed: () => Navigator.pushNamed(context, Routers.SIGN_UP),
                    child: Text('Sign up')
                  ),
                ],
              ),
            ],
          ),
        );
      }
    }
  }
}