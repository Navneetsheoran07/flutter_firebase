import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';
import 'RegisterPage.dart';


class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
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
            //         .signIn(emailController.text, passwordController.text);
            //     // Navigate to home screen if needed
            //   },
            //   child: Text('Sign In'),
            // ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
