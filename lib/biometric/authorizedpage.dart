import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthorizedPage extends StatefulWidget {
  @override
  _AuthorizedPageState createState() => _AuthorizedPageState();
}

class _AuthorizedPageState extends State<AuthorizedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Auth Demo"),
      ),
      body: Center(
        child: Text("YOU HAVE BEEN AUTHORIZED TO USE THE APP"),
      ),
    );
  }


}
