import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await Provider.of<AuthViewModel>(context, listen: false)
            //         .register(emailController.text, passwordController.text);
            //     Navigator.pop(context); // Navigate back to sign-in screen
            //   },
            //   child: Text('Register'),
            // ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
