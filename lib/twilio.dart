import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TwoFactorAuthDemo(),
    );
  }
}

class TwoFactorAuthDemo extends StatelessWidget {
  final TwilioFlutter twilioFlutter = TwilioFlutter(
    accountSid: 'YOUR_TWILIO_ACCOUNT_SID',
    authToken: 'YOUR_TWILIO_AUTH_TOKEN',
    twilioNumber: 'YOUR_TWILIO_PHONE_NUMBER',
  );

  Future<void> sendSms(String phoneNumber, String message) async {
    try {
      await twilioFlutter.sendSMS(
        toNumber: phoneNumber,
        messageBody: message,
      );
    } catch (e) {
      print('Error sending SMS: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2FA with Twilio SMS Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Replace with your own recipient phone number and message
            sendSms('+1234567890', 'Your 2FA code is: 123456');
          },
          child: Text('Send 2FA Code via SMS'),
        ),
      ),
    );
  }
}
