import 'package:CoffeeAppUI/home.dart';
import 'package:CoffeeAppUI/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController emailcontroller = TextEditingController();

class _LoginState extends State<Login> {
  TextEditingController passwordcontroller = TextEditingController();
  sl() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Login Successfully'),
        duration: const Duration(seconds: 1),
        
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Icon(
                  Icons.person_outlined,
                  color: Colors.grey[500],
                  size: 140,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Wellcome Back",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Signin to Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      child: TextFormField(
                        controller: emailcontroller,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.mail,
                              size: 30, color: Theme.of(context).primaryColor),
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      sl();
                     
                    },
                    child: Text("Login"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have and account ",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Register(
                                    togScreen: null,
                                  ))),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
