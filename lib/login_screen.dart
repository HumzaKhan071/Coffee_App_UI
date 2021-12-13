import 'package:CoffeeAppUI/home_screen.dart';
import 'package:CoffeeAppUI/widgets/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/loginbg.png"),
                fit: BoxFit.cover)),
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
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "The Best",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
                        color: Color(0xddFDB94E),
                      ),
                      child: Center(
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context, CupertinoPageRoute(builder: (_)=>HomeScreen()));
                            },
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            )),
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
                        border: Border.all(color: Color(0xddFDB94E)),
                      ),
                      child: Center(
                        child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            )),
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
                    LoginButton(
                      bgColor: Colors.white,
                      image: "assets/images/google.png",
                      imgSize: 25,
                      text: "Connect with Google",
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginButton(
                      bgColor: Color(0xff1976D2),
                      image: "assets/images/facbook.png",
                      imgSize: 25,
                      text: "Connect with Facebook",
                      textColor: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(child: Image.asset("assets/images/LoginCoffee.png"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
