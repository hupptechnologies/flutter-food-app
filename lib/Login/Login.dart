import 'package:flutter/material.dart';
import '../Widgets/PageHeader.dart';
import '../Widgets/CustomButton.dart';
import '../Widgets/FormInputDecoration.dart';

class Login extends StatefulWidget{
  createState() => LoginState();
}

class LoginState extends State<Login>{

  FocusNode email;
  FocusNode password;
  bool _autoValid = false;
  final _loginForm = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    email = FocusNode();
    password = FocusNode();
  }

  login(){
    password.unfocus();
    email.unfocus();
    setState(() {
      _autoValid = true;
    });
    if(_loginForm.currentState.validate()){

    }else{
      print("ERRROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _loginForm,
            autovalidate: _autoValid,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  PageHeader(title: "Sing In"),
                  SizedBox(height: 30.0,),
                  TextFormField(
                    focusNode: email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: FormInputDecoration.CustomTextStyle(),
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.none,
                    decoration: FormInputDecoration.FormInputDesign(name: "Email"),
                    onFieldSubmitted: (node){
                      email.unfocus();
                      FocusScope.of(context).requestFocus(password);
                    },
                    validator: (value){
                      if(value.isEmpty || value.trim() == ''){
                        return "Enter email";
                      }
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    focusNode: password,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    style: FormInputDecoration.CustomTextStyle(),
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.none,
                    decoration: FormInputDecoration.FormInputDesign(name: "Password"),
                    onFieldSubmitted: (node){
                      password.unfocus();
                      login();
                    },
                    validator: (value){
                      if(value.isEmpty || value.trim() == ''){
                        return "Enter password";
                      }
                    },
                  ),
                  SizedBox(height: 20.0,),
                  FlatButton(
                    onPressed: login,
                    child: CustomButton(text: "Login", color: Colors.green),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Forgot Password ?",style: TextStyle(fontWeight: FontWeight.w500),),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (context){
                                    return SimpleDialog(
                                      titlePadding: EdgeInsets.all(10.5),
                                      contentPadding: EdgeInsets.all(20.0),
                                      title: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text("Reset password"),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: InkResponse(
                                              onTap: (){
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(Icons.close),
                                            ),
                                          )
                                        ],
                                      ),
                                      children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
                                                  obscureText: true,
                                                  textInputAction: TextInputAction.done,
                                                  style: FormInputDecoration.CustomTextStyle(),
                                                  textAlign: TextAlign.center,
                                                  textCapitalization: TextCapitalization.none,
                                                  decoration: FormInputDecoration.FormInputDesign(name: "Password"),
                                                )
                                              ],
                                            ),
                                          )
                                      ],
                                    );
                                },
                                barrierDismissible: false
                            );
                          },
                          child: Text("Click here",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.teal),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    alignment: Alignment.center,
                    child: Text("OR",style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 20.0,),
                  FlatButton(
                    onPressed: (){},
                    child: CustomButton(
                      text: "Connect with facebook",
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  FlatButton(
                    onPressed: (){},
                    child: CustomButton(
                      text: "Connect with twitter",
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}