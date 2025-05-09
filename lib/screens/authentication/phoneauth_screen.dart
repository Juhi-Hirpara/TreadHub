
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'HomeScreen.dart';

class phoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  _phoneAuthScreenState createState() => _phoneAuthScreenState();
}

class _phoneAuthScreenState extends State<phoneAuthScreen> {
  final countryCodeController = TextEditingController(text: '+91');
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  bool otpSent = false;
  bool otpVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade700,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal.shade700,
                child: Icon(
                  CupertinoIcons.person_alt_circle,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              SizedBox(height: 50),
              Text(
                otpSent ? 'Enter OTP' : 'Enter your phone',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                otpSent
                    ? 'We have sent a confirmation code to your phone. Enter it below to verify.'
                    : 'We will send a confirmation code to your phone',
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              otpSent ? _buildOtpField() : _buildPhoneField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            if (otpSent) {
              if (otpVerified) {
                // Navigate to the HomeScreen after successful OTP verification
                Navigator.pushReplacementNamed(context, HomeScreen.id);
              } else {
                bool otpVerified = await verifyOtp();
                setState(() {
                  this.otpVerified = otpVerified;
                });
                if (otpVerified) {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                }
              }
            } else {
              String number = '${countryCodeController.text}${phoneController.text}';
              showAlertDialog(context);
              bool otpSent = await sendOtp(number);
              Navigator.pop(context); // Close the dialog
              if (otpSent) {
                setState(() {
                  this.otpSent = true;
                });
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              otpSent ? 'Verify OTP' : 'Next',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade700,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
      backgroundColor: Colors.teal.shade200,
    );
  }

  Widget _buildPhoneField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 45,
                child: TextFormField(
                  controller: countryCodeController,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    labelStyle: TextStyle(color: Colors.black),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                child: TextFormField(
                  autofocus: true,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Number',
                    hintText: 'Enter your phone number',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOtpField() {
    return Container(
      height: 50,
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        controller: otpController,
        decoration: InputDecoration(
          labelText: 'OTP',
          hintText: 'Enter OTP sent to your phone',
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.teal.shade700,
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(width: 16),
          Text(
            'Please Wait',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> sendOtp(String phoneNumber) async {
    final accountSid ;  // Replace with your Twilio Account SID
    final authToken ;    // Replace with your Twilio Auth Token
    final twilioNumber ; // Replace with your Twilio phone number

    final uri = Uri.parse('https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json');
    final headers = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
    };
    final body = {
      'To': phoneNumber,
      'From': twilioNumber,
      'Body': 'Your OTP code is: 123456',
    };

    final response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 201) {
      print('OTP sent successfully');
      return true;
    } else {
      print('Failed to send OTP: ${response.body}');
      return false;
    }
  }

  Future<bool> verifyOtp() async {
    String enteredOtp = otpController.text;
    if (enteredOtp == '123456') {
      print('OTP verified successfully');
      return true;
    } else {
      print('Invalid OTP');
      return false;
    }
  }
}
