import 'package:flutter/material.dart';
import 'package:new_sentinel_app/helpers/routers.dart';
import 'package:provider/provider.dart';

import '../databases/app_database.dart';
import '../databases/dao/user_dao.dart';


class SignUp extends StatefulWidget{
  @override 
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp>{
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  bool _checkMail;
  bool _autoValidate = false;
  bool _eyeClosed = true;
  String _eMail;
  String _passWord;
  String _rePassword;
  Widget build(BuildContext context){
    final daoUser = Provider.of<UserDao>(context);
    return FutureBuilder<List<User>>(
      future: daoUser.getUser(),
      builder:(context, snapshot){ return
    Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _keyForm,
            autovalidate: _autoValidate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String arg) {
                    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if(!regex.hasMatch(arg)) return 'Enter the right Email address'; 
                    else if(_checkMail == false) return 'This Email was used!'; else return null;},
                  onChanged: (String val){ this._eMail = val;},
                ),
                TextFormField(
                  obscureText: _eyeClosed,
                  validator: (String passWords) {
                    RegExp regex = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
                    if(!regex.hasMatch(passWords)) return 'Least 6 characters, have both'; else return null;},
                  decoration: InputDecoration(
                    hintText:'Enter your password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  suffixIcon: IconButton(icon: Icon(_eyeClosed? Icons.visibility_off:Icons.visibility, color: Colors.blueAccent,), onPressed:() => setState((){_eyeClosed = !_eyeClosed;})),),
                  onChanged: (String val){_passWord =val;},
                ),
                TextFormField(
                  obscureText: _eyeClosed,
                  validator: (String passWords) {
                    if(_passWord != passWords)
                    return 'RePassword must like password!'; else return null;},
                  decoration: InputDecoration(
                    hintText:'ReEnter password',
                    helperText: 'ReEnter your password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(icon: Icon(_eyeClosed? Icons.visibility_off:Icons.visibility, color: Colors.blueAccent,), onPressed:(){setState(() => _eyeClosed = !_eyeClosed);} ),),
                  onChanged: (String val){_rePassword = val;}, 
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Sign Up'),
                  onPressed: () async {
                  setState((){_checkMail = true;});
                  await checkMail(snapshot);
                  await valiInput();
                  if(_autoValidate == false){
                    final user = User(
                      eMail: _eMail,
                      passWord: _rePassword,);
                    print('${user.toString()}');
                    await daoUser.insertUser(user);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Center(child: Text('Congratulations', style: TextStyle(fontSize: 28.0, color: Colors.blue),),),
                        content: Center(child: Text('You signed up a new account with Email: \n$_eMail')),
                        actions: <Widget>[
                          Center(child: FlatButton(
                            child: Text('Sign Up', style: TextStyle(fontSize: 25.0, color: Colors.blue),),
                            onPressed:() => Navigator.pushNamed(context, Routers.LOGIN),
                          ))
                        ],
                        ));
                    }
                  },
                )
              ]
            ),
          ),
        ),
      ),
    );
  },);}
  Future valiInput() async {
    if(_keyForm.currentState.validate()){
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
  Future<void> checkMail(AsyncSnapshot<List<User>> snapshot) async {
    print('${snapshot.toString()}');
    final users =  snapshot.data?? List();
    for(int i = 0; i < users.length; i++){
        if(users[i].eMail == _eMail) { setState(() {
        _checkMail = false;});}}
  }
}