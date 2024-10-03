import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Google Sign-In')),
      body: Center(
        child: authViewModel.user == null
            ? ElevatedButton(
          onPressed: () => authViewModel.signInWithGoogle(context),
          child: Text('Sign in with Google'),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${authViewModel.user!.displayName}'),
            ElevatedButton(
              onPressed: () => authViewModel.signOut(),
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
