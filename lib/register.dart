import 'dart:convert';
import 'InputDeco_design.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'DashBoard.dart';

import 'main.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Register(),
    );
  }
}
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username, password, fullname, phoneno;

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController full = TextEditingController();
  TextEditingController phone = TextEditingController();
  Future register() async {
    var Url = "http://10.0.2.2/api/register.php?username="+user.text+"&password="+pass.text+"&fullname="+full.text+"&phoneno="+phone.text+"";
    print(Url);
    var resp = await http.post(Uri.parse(Url), body: {
      "username": user.text,
      "password": pass.text,
      "fullname": full.text,
      "phoneno": phone.text,
    });
    var data = json.decode(resp.body);
    print(data);
    if (data == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
      Fluttertoast.showToast(
          msg: "Rgistered not Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0

      );
    } else {
      Fluttertoast.showToast(
          msg: " Registered Sucessfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);


    }

  }
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    controller: user,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"User Name"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter UserName';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      username = value;
                    },
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: pass,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Password"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    controller: full,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Full Name"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Full Name';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      fullname = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Phone no"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Phone no';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      phoneno = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: (){
                      if(_formkey.currentState.validate())
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      }else{
                        print("UnSuccessfull");
                      }
                      register();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("Register"),
                  ),

                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}