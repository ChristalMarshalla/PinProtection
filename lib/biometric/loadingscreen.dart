import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_protection/biometric/alert_dialogue_widget.dart';
import 'package:pin_protection/biometric/authorizedpage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:local_auth/local_auth.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocalAuthentication authentication = LocalAuthentication();

  @override
  void initState() {
//
    checkBiometric().then((has_sensor) {
      has_sensor
          ? _authenticate().then((autherized) {
              autherized
                  ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AuthorizedPage()))
                  : showAlertDialogForUserCancelAuth(context);
            })
          : showAlertDialogForNoSensorFound(context);
    });
  }

  Future<bool> checkBiometric() async {
    bool hasBiometric = false;

    try {
      hasBiometric = await authentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    return hasBiometric;
  }

  Future<bool> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await authentication.authenticateWithBiometrics(
          localizedReason: "SCAN YOUR FINGER TO GET AUTHORIZED",
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    return authenticated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOADING...",
                style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              SpinKitCircle(
                color: Colors.blue,
                size: 70,
              )
            ],
          ),
        ));
  }
}
