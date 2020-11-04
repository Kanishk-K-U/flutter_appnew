import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/phone_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'Dashboard.dart';

class LoginScreen extends StatefulWidget {


  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  GoogleSignInAccount _currentUser;


  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });

      if (_currentUser != null) {
        _handleFirebase();
      }
    });

    _googleSignIn.signInSilently(); //Auto login if previous login was success
  }

  void _handleFirebase() async {
    GoogleSignInAuthentication googleAuth = await _currentUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final AuthResult firebaseUser =
    await firebaseAuth.signInWithCredential(credential);

    if (firebaseUser != null) {
      print('Login');


      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Dashboard()));
    }
  }


  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: SingleChildScrollView( scrollDirection: Axis.vertical,
        child: Container(
          child: new Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.center,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                color: Color(0Xffdb3236),
                                onPressed: () => {},
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: new FlatButton(
                                          onPressed: _handleSignIn,
                                          padding: EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                          ),
                                          child: new Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                "GOOGLE",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PhoneLogin()
            ],
          ),
        ),
      ),
    );
  }
}
