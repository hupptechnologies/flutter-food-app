import 'package:flutter/material.dart';
import '../../Widgets/PageHeader.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/FormInputDecoration.dart';
import '../../Bloc/UserBloc.dart';
import '../../Modal/Validation.dart';
import '../../Widgets/Loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Modal/User.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import '../Welcome/Welcome.dart';
import '../../Modal/Authentication.dart';

class Signup extends StatefulWidget {
  createState() => SignupState();
}

class SignupState extends State<Signup> {
  Authentication _authentication;
  FocusNode username;
  FocusNode email;
  FocusNode password;
  FocusNode confirmPassword;

  TextEditingController emailCtrl, passwordCtrl, usernameCtrl, cpasswordCtrl;

  final _formKey = GlobalKey<FormState>();
  bool _autoValid = false;
  bool loader = false;

  final _userBloc = UserBloc();

  @override
  void initState() {
    super.initState();

    _authentication = Authentication();

    _autoValid = false;
    loader = false;

    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    usernameCtrl = TextEditingController();
    cpasswordCtrl = TextEditingController();

    username = FocusNode();
    email = FocusNode();
    password = FocusNode();
    confirmPassword = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    username?.unfocus();
    email?.unfocus();
    password?.unfocus();
    confirmPassword?.unfocus();
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    usernameCtrl?.dispose();
    cpasswordCtrl?.dispose();
  }

  signup(BuildContext context) async {
    email.unfocus();
    password.unfocus();
    username.unfocus();
    confirmPassword.unfocus();

    setState(() => _autoValid = true);
    if (_formKey.currentState.validate()) {
      try {
        setState(() {
          loader = true;
        });
        print("SUCCESS");
        User u = User(
            email: emailCtrl.value.text, password: passwordCtrl.value.text);
        FirebaseUser _user = await _authentication.SingupUser(u);
        print(_user);
        if (_user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Welcome(
                      user: _user,
                    ),
              ),
              ModalRoute.withName('/root'));
        }
        setState(() {
          loader = false;
        });
      } on PlatformException catch (e) {
        _authentication.ShowToast(context, _authentication.HandleError(e));
        setState(() {
          loader = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Builder(builder: (context) {
          return Stack(
            children: <Widget>[
              SignupForm(context),
              loader ? LoaderWidget() : Container()
            ],
          );
        })));
  }

  Widget SignupForm(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      autovalidate: _autoValid,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            PageHeader(title: "Register Now"),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: usernameCtrl,
              textInputAction: TextInputAction.next,
              focusNode: username,
              style: FormInputDecoration.CustomTextStyle(),
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.none,
              decoration: FormInputDecoration.FormInputDesign(name: "Username"),
              onFieldSubmitted: (node) {
                username.unfocus();
                FocusScope.of(context).requestFocus(email);
              },
              validator: (value) => CheckFieldValidation(
                  val: value,
                  password: null,
                  fieldName: "Username",
                  fieldType: VALIDATION_TYPE.TEXT),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
              focusNode: email,
              textInputAction: TextInputAction.next,
              style: FormInputDecoration.CustomTextStyle(),
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.none,
              decoration:
                  FormInputDecoration.FormInputDesign(name: "Email Address"),
              onFieldSubmitted: (node) {
                email.unfocus();
                FocusScope.of(context).requestFocus(password);
              },
              validator: (value) => CheckFieldValidation(
                  val: value,
                  password: null,
                  fieldName: "Email",
                  fieldType: VALIDATION_TYPE.EMAIL),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: passwordCtrl,
              textInputAction: TextInputAction.next,
              focusNode: password,
              obscureText: true,
              style: FormInputDecoration.CustomTextStyle(),
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.none,
              decoration: FormInputDecoration.FormInputDesign(name: "Password"),
              onFieldSubmitted: (node) {
                password.unfocus();
                FocusScope.of(context).requestFocus(confirmPassword);
              },
              validator: (value) => CheckFieldValidation(
                  val: value,
                  password: null,
                  fieldName: "Password",
                  fieldType: VALIDATION_TYPE.PASSWORD),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: cpasswordCtrl,
              textInputAction: TextInputAction.done,
              focusNode: confirmPassword,
              obscureText: true,
              style: FormInputDecoration.CustomTextStyle(),
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.none,
              decoration:
                  FormInputDecoration.FormInputDesign(name: "Confirm password"),
              onFieldSubmitted: (node) {
                confirmPassword.unfocus();
                signup(context);
              },
              validator: (value) => CheckFieldValidation(
                  val: value,
                  password: passwordCtrl.value.text,
                  fieldName: "Confirm password",
                  fieldType: VALIDATION_TYPE.CONFIRM_PASSWORD),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomButton(
              text: "Sign up",
              color: Colors.green,
              onPressed: () => signup(context),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "OR",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
              ),
            ),
            CustomButton(
              text: "Connect with facebook",
              color: Colors.indigo,
              onPressed: () {},
            ),
            SizedBox(
              height: 5.0,
            ),
            CustomButton(
              text: "Connect with twitter",
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
