import 'package:flutter/material.dart';
import '../Widgets/PageHeader.dart';
import '../Widgets/CustomButton.dart';
import '../Widgets/FormInputDecoration.dart';
import '../Bloc/UserBloc.dart';


class Signup extends StatefulWidget{
  createState() => SignupState();
}

class SignupState extends State<Signup>{


  FocusNode username;
  FocusNode email;
  FocusNode password;
  FocusNode confirmPassword;

  final _formKey = GlobalKey<FormState>();
  bool _autoValid = false;

  final _userBloc = UserBloc();

  @override
  void initState() {
    _autoValid = false;

    // TODO: implement initState
    super.initState();
    username = FocusNode();
    email = FocusNode();
    password = FocusNode();
    confirmPassword = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username?.unfocus();
    email?.unfocus();
    password?.unfocus();
    confirmPassword?.unfocus();
  }


  signup(){
    setState(()=> _autoValid = true );
    if(_formKey.currentState.validate()){
      print("SUCCESS");
    }else{
      print("ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: _autoValid,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  PageHeader(title: "Register Now"),
                  SizedBox(height: 30.0,),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: username,
                    style: FormInputDecoration.CustomTextStyle(),
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.none,
                    decoration: FormInputDecoration.FormInputDesign(name: "Username"),
                    onFieldSubmitted: (node){
                      username.unfocus();
                      FocusScope.of(context).requestFocus(email);
                    },
                    validator: (value){
                      if(value.isEmpty || value.trim() == ''){
                        return "Enter username";
                      }
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode: email,
                    textInputAction: TextInputAction.next,
                    style: FormInputDecoration.CustomTextStyle(),
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.none,
                    decoration: FormInputDecoration.FormInputDesign(name: "Email Address"),
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
                    textInputAction: TextInputAction.next,
                    focusNode: password,
                    obscureText: true,
                    style: FormInputDecoration.CustomTextStyle(),
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.none,
                    decoration: FormInputDecoration.FormInputDesign(name: "Password"),
                    onFieldSubmitted: (node){
                      password.unfocus();
                      FocusScope.of(context).requestFocus(confirmPassword);
                    },
                    validator: (value){
                      if(value.isEmpty || value.trim() == ''){
                        return "Enter password";
                      }
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                      textInputAction: TextInputAction.done,
                      focusNode: confirmPassword,
                      obscureText: true,
                      style: FormInputDecoration.CustomTextStyle(),
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.none,
                      decoration: FormInputDecoration.FormInputDesign(name: "Confirm password"),
                      onFieldSubmitted: (node){
                        confirmPassword.unfocus();

                      },
                      validator: (value){
                        if(value.isEmpty || value.trim() == ''){
                          return "Enter Confirm password";
                        }
                      },

                  ),
                  SizedBox(height: 20.0,),
                  FlatButton(
                    onPressed:signup,
                    child: CustomButton(
                      text: "Sign up",
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("OR",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),),
                  ),
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
        )
      )
    );
  }

}

