import 'package:CoffeeAppUI/home.dart';
import 'package:CoffeeAppUI/login.dart';
import 'package:CoffeeAppUI/register.dart';

import 'package:CoffeeAppUI/widgets/login_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Login Successfully'),
        duration: const Duration(seconds: 1),
        
      ));

     
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "KOKUMI",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  "The Best",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      padding: EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xffFDB94E),
                      ),
                      child: Center(
                        child: FlatButton(
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Login(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      padding: EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xffFDB94E))),
                      child: Center(
                        child: FlatButton(
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Register(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        child: Container(

                          child: Image.asset("assets/images/google.png",),
                          
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    LoginButton(
                      bgColor: Color(0xff1976D2),
                      image: "assets/images/facebook.png",
                      imgsize: 30,
                      text: "Connect with facebook",
                      textColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Image.asset("assets/images/LoginCoffee.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
