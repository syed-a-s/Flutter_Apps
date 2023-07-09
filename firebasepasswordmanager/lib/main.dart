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
} // main

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
      routes: appNavRoutes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialRoute = ModalRoute.of(context)?.settings.name;

    if(initialRoute == 'login') {
      return Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: _buildHomePageBody,
        ),
      );
    } else {
      // show a loading indicator
      return const CircularProgressIndicator();
    }
  }
}   // end of MyHomePage Class

// deals with login screen and navigating to passwords after log in
Widget _buildHomePageBody(BuildContext context, AsyncSnapshot<User?> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting){
    return _loadingDisplay();
  } else {
    if (snapshot.hasData){
      WidgetsBinding.instance?.addPostFrameCallback((_) {
       Navigator.pushNamedAndRemoveUntil(context, "passwords", (route) => false);
      });

      return Container();
    } else {
      return LoginSignUpDisplay(auth: auth);
    }
  }
} // end of _buildHomePageBody

Widget _loadingDisplay (){
  return const Center(
    child: CircularProgressIndicator(),
  );
}
