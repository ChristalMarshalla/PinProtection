import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BiometricAuthenticationDemo(),
    );
  }
}

class BiometricAuthenticationDemo extends StatefulWidget {
  @override
  _BiometricAuthenticationDemoState createState() =>
      _BiometricAuthenticationDemoState();
}

class _BiometricAuthenticationDemoState
    extends State<BiometricAuthenticationDemo> {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  String _authStatus = '';

  Future<void> _authenticate() async {
    try {
      bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
      List<BiometricType> availableBiometrics =
          await localAuthentication.getAvailableBiometrics();

      if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
        bool authenticated = await localAuthentication.authenticate(
          localizedReason: 'Authenticate to access your sensitive data',
        );

        if (authenticated) {
          setState(() {
            _authStatus = 'Authentication successful!';
          });
        } else {
          setState(() {
            _authStatus = 'Authentication failed or canceled';
          });
        }
      } else {
        setState(() {
          _authStatus = 'Biometric authentication is not available';
        });
      }
    } catch (e) {
      setState(() {
        _authStatus = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Authentication Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate with Biometrics'),
            ),
            SizedBox(height: 20),
            Text(_authStatus),
          ],
        ),
      ),
    );
  }
}
