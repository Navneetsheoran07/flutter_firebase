import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email/Screens/OtpSignInPage.dart';
import 'package:provider/provider.dart';

import 'FirestoreCurd/ Viewss/ImageScreen.dart';
import 'FirestoreCurd/ Viewss/MyDataScreen.dart';
import 'FirestoreCurd/ViewModels/ImageViewModel.dart';
import 'FirestoreCurd/ViewModels/UserViewModel.dart';
import 'Screens/LoginScreen.dart';
import 'ViewModels/AuthViewModel.dart';
import 'Screens/SignInScreen.dart';
// for adding data on firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>MyDataViewModel()),
      ],

      child: MaterialApp(
       // home: SignInPage(),
      //  home: Otpsigninpage(),
      //   home: LoginScreen(),

        home:MyDataScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// for adding image in firebase storage
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ImageViewModel()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MVVM Image Upload',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageScreen(),
//     );
//   }
// }
