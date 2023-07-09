import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'data.dart';
import 'login_signup_page.dart';
import 'p0_after_login.dart';

// FirebaseAuth fetches the authentication state of
// your user, such as whether they're logged in or 
// logged out.
final FirebaseAuth auth = FirebaseAuth.instance;
const String _appTitle = 'Firebase Demo';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}  // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: fBaseAppNavRoutes,
    );
  }
} // end of MyApp

class MyHomePage  extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( title:
        const Text(_appTitle),
      ),
      body:  StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: _buildHomePageBody,
      ),
    );
  }
}   // end of MyHomePage Class

Widget _buildHomePageBody(BuildContext context, AsyncSnapshot<User?> snapshot) {
  Widget body;

  if (snapshot.connectionState == ConnectionState.waiting){
    body = _loadingDisplay();
  } else {
    if (snapshot.hasData){
      // User is still logged-in,
      // so go to
      // p0_after_login.dart
      body = AfterLoginDisplay(auth: auth, fbUser: snapshot.data!);
    } else {
      // User needs to login or sign-up,
      // so go to
      // login_signup_page.dart
      body = LoginSignUpDisplay(auth: auth);
    }
  }

  return body;
} // end of _buildHomePageBody

Widget _loadingDisplay (){
  return const Center(
    child: CircularProgressIndicator(),
  );
}