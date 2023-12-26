import 'package:auth_test/verifycode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'login_with_phone.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: "login",
         routes: {
           'login': (context) => LoginPage(),
           'login_with_phone': (context) => LoginWithPhone(),

         },
  ));
}


Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      // storageBucket: '',
      apiKey: 'AIzaSyB02Rpo984HyutOHYiq77ctScmp_3-S_M4',
      appId: '1:687040477575:android:790f12f15f02c60760fb22',
      messagingSenderId: '687040477575',
      projectId: 'authtest-39de3',
    ),
  );
}


