import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

showAlertDialogForNoSensorFound(BuildContext context) {

  AlertDialog alertDialog = AlertDialog(
    title: Text(" YOUR DEVICE HAS NO FINGERPRINT SENSOR"),
    actions: [
      ElevatedButton(onPressed: ()=> SystemNavigator.pop(), child: Text("OK"))
    ],
  );

  showDialog(context: context,
      builder: (BuildContext context){
        return alertDialog;
      });
}

showAlertDialogForUserCancelAuth(BuildContext context) {

  AlertDialog alertDialog = AlertDialog(
    title: Text("YOU HAVE NOT AUTHORIZED TO USE THIS APP"),
    actions: [
      ElevatedButton(onPressed: ()=> SystemNavigator.pop(), child: Text("CLOSE APP"))
    ],
  );

  showDialog(context: context,
      builder: (BuildContext context){
        return alertDialog;
      });
}