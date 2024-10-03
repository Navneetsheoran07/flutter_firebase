import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModels/AuthViewModel.dart';
import 'OtpVerificationPage.dart';


class Otpsigninpage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await Provider.of<AuthViewModel>(context, listen: false)
            //         .verifyPhoneNumber(phoneController.text);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => OtpVerificationPage()),
            //     );
            //   },
            //   child: Text('Send OTP'),
            // ),
          ],
        ),
      ),
    );
  }
}
