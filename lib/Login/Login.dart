import 'package:flutter/material.dart';
import '../Widgets/PageHeader.dart';
import '../Widgets/CustomButton.dart';
import '../Widgets/FormInputDecoration.dart';

class Login extends StatefulWidget{
  createState() => LoginState();
}

class LoginState extends State<Login>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                PageHeader(title: "Sing In"),
                SizedBox(height: 30.0,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: FormInputDecoration.CustomTextStyle(),
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: FormInputDecoration.FormInputDesign(name: "Email"),
                  onFieldSubmitted: (node){
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  style: FormInputDecoration.CustomTextStyle(),
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: FormInputDecoration.FormInputDesign(name: "Password"),
                  onFieldSubmitted: (node){
                  },
                ),
                SizedBox(height: 20.0,),
                FlatButton(
                  child: CustomButton(text: "Login", color: Colors.green),
                ),
                SizedBox(height: 20.0,),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Forgot Password ?",style: TextStyle(fontWeight: FontWeight.w500),),
                      Text("Click here",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.teal),),
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
                  child: CustomButton(
                    text: "Connect with facebook",
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 5.0,),
                FlatButton(
                  child: CustomButton(
                    text: "Connect with twitter",
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}