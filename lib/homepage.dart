import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final IconData icon;
  final String title;

  final FirebaseUser user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  HomePage({Key key, @required this.user,this.icon,this.title})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer:  Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child:Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: const Color(0xFF262AAA),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    ListTile(
                      title: Text(
                        "Ganeshbalaji",
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "www.hellodaily.com",
                        style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 18,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },

                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },

                    ),
                    RaisedButton(

                      child: Text("Sign out"),
                      onPressed: () {
                        _firebaseAuth.signOut();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => App()));
                      },
                    ),


                  ],
                ),
              ),
            ),],),),

      body: Column(

      ),
    );
  }
}






