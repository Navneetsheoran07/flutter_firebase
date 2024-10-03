import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';


class OtpVerificationPage extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              decoration: InputDecoration(labelText: 'OTP'),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await Provider.of<AuthViewModel>(context, listen: false)
            //         .signInWithOtp(otpController.text);
            //     // Navigate to home screen if needed
            //   },
            //   child: Text('Verify OTP'),
            // ),
          ],
        ),
      ),
    );
  }
}
