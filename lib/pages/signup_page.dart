import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project1pdp64/pages/home_page.dart';

import '../services/messenger icons.dart';
import 'signin_page.dart';

class SignUp extends StatefulWidget {
  static final String id = "signup_page";

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  _callSignInPage() {
    Navigator.pushNamed(context, SignIn.id);
  }

  final emailController=TextEditingController();
  final numberController=TextEditingController();
  final adressController=TextEditingController();



  _doLogin() {
    String email=emailController.text.toString().trim();
    String number=numberController.text.toString().trim();
    String adress=adressController.text.toString().trim();

    var box = Hive.box('data');
    box.put('email',email);
    box.put('number',number);
    box.put('adress',adress);


    String user_email=box.get('email');
    String user_num=box.get('number');
    String user_adress =box.get('adress');

    print(user_email);
    print(user_num);
    print(user_adress);



    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 127, 123, 1),
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 30, bottom: 30),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text("Welcome",
                          style: TextStyle(
                              color: Color.fromRGBO(47, 175, 171, 1))),
                      SizedBox(height: 10),
                      Text("Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70),

                      //Email Password
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 16)),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Number',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextField(
                              controller: numberController,
                              decoration: InputDecoration(
                                  hintText: "Enter Number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 16)),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextField(
                              controller: adressController,
                              decoration: InputDecoration(
                                  hintText: "Enter Adress",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 16)),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 40),

                      Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(7, 127, 123, 1),
                        ),
                        child: FlatButton(
                            onPressed: _doLogin,
                            child: (Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ))),
                      ),

                      SizedBox(height: 20),

                      Text(
                        '-------------------------OR-------------------------',
                        style: TextStyle(
                            color: Colors.grey.shade300, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icons("assets/images/item_2.png", 20),
                          SizedBox(width: 20),
                          icons("assets/images/item_3.png", 20),
                          SizedBox(width: 20),
                          icons("assets/images/item_4.png", 20)
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                              onTap: _callSignInPage,
                              child: Text("Sign In",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)))
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
