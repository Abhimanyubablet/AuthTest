import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  FirebaseAuth auth=FirebaseAuth.instance;

  final emailLoginController =TextEditingController();
  final passwordLoginController =TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Login"),
      ) ,

      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Customize padding
          child: Form(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: emailLoginController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                  ),
                ),
                // SizedBox(height:height*0.02,),
                TextFormField(
                  controller: passwordLoginController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Password",
                  ),
                ),
                SizedBox(height:10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                            ),
                            onPressed: () async {

                              await Firebase.initializeApp(); // Add this line
                              try {
                                UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                  email: emailLoginController.text.toString(),
                                  password: passwordLoginController.text.toString(),
                                );

                                print("User created: ${userCredential.user?.uid}");
                                // Print a successful registration message
                                print("Registration successful!");

                                // Show a toast message
                                Fluttertoast.showToast( msg:"Regestration successful ",backgroundColor: Colors.blueGrey,timeInSecForIosWeb: 5);


                              } catch (e) {
                                print("Error during sign up: $e");

                                // Handle the error, show a message, etc.
                              }

                              ElevatedButton.styleFrom(
                                primary: Colors.blue, // Button color
                                onPrimary: Colors.white, // Text color
                                padding: const EdgeInsets.all(16.0), // Padding around the button content
                              );
                            }, child: const Text("Sign up")),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                          ),
                          onPressed: () {

                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailLoginController.text,
                                password: passwordLoginController.text)
                                .then((value) {
                              Fluttertoast.showToast( msg:"Login successful ",backgroundColor: Colors.blueGrey,timeInSecForIosWeb: 5);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                            }).onError((error, stackTrace) {
                              print("Error: ${error.toString()}");
                              Fluttertoast.showToast( msg:"Invalid email and password ",backgroundColor: Colors.blueGrey,timeInSecForIosWeb: 5);
                            });


                            ElevatedButton.styleFrom(
                              primary: Colors.blue, // Button color
                              onPrimary: Colors.white, // Text color
                              padding: const EdgeInsets.all(16.0), // Padding around the button content
                            );
                          }, child: const Text("Login"),
                        ),
                      ),



                    ]
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "login_with_phone");
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    child: Center(
                      child: Text("Login with phone"),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                Container(
                  child: Center(
                    child: SizedBox(
                      width: 300, // Set the desired width
                      height: 50,
                      child: SignInButton(
                        onPressed: () {
                          _handleGoogleSignIn();
                        },
                        Buttons.google,
                        text: "Sign up with Google",
                      ),
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),

    );
  }

  void _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        Fluttertoast.showToast(
          msg: "Google Login successful",
          backgroundColor: Colors.blueGrey,
          timeInSecForIosWeb: 5,
        );

        Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
      } else {
        Fluttertoast.showToast(
          msg: "Google Login failed",
          backgroundColor: Colors.blueGrey,
          timeInSecForIosWeb: 5,
        );
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Google Login Failed",
        backgroundColor: Colors.blueGrey,
        timeInSecForIosWeb: 5,
      );
    }
  }

}
