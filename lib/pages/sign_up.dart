import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/circle.dart';
import '../widgets/input_text.dart';
import '../api/account.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '', _email = '', _password = '';

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
     final result= await AccountApi.register(
          name: _name, email: _email, password: _password);
     if(result!=null){
       Navigator.pushNamed(context, "home");
     }else{
       print("registro fallido");
     }
    }
  }

  _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -size.width * 0.2,
                right: -size.width * 0.15,
                child: Circle(radius: size.width * 0.4, colors: [
                  Colors.pink,
                  Colors.pinkAccent,
                ]),
              ),
              Positioned(
                top: -size.width * 0.2,
                left: -size.width * 0.1,
                child: Circle(
                    radius: size.width * 0.3,
                    colors: [Colors.orange, Colors.deepOrange]),
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SafeArea(
                      child: Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      Text(
                        "Hello!\nSign up to get started.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, height: 1.2, color: Colors.white),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/hi.svg',
                            width: 65,
                            height: 65,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 30)
                            ]),
                      ),
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              InputText(
                                label: "FULL NAME",
                                keyboardType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text.isEmpty) return "Ingrese un nombre";

                                  final exp = RegExp(r'^[A-Za-z ]+$');
                                  if (exp.hasMatch(text)) {
                                    this._name = text;
                                    return null;
                                  }
                                  return "Ingrese solo letras";
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              InputText(
                                label: "EMAIL ADDRESS",
                                keyboardType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text.contains("@")) {
                                    this._email = text;
                                    return null;
                                  }
                                  return "Ingrese un email valido";
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              InputText(
                                label: "PASSWORD",
                                isSecure: true,
                                validator: (text) {
                                  if (text.length > 5) {
                                    this._password = text;
                                    return null;
                                  }
                                  return "Ingrese una contraseña valida";
                                },
                              ),
                            ],
                          )),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(5),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: _submit,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                          CupertinoButton(
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.pinkAccent),
                            ),
                            onPressed: _goBack,
                          )
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Positioned(
                top: 0,
                left: 15,
                child: SafeArea(
                    child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: CupertinoButton(
                      padding: EdgeInsets.all(4),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black12,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: _goBack),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
