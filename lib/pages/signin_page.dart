import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project1pdp64/services/messenger%20icons.dart';

import '../model/user_model.dart';
import 'home_page.dart';
import 'signup_page.dart';

class SignIn extends StatefulWidget {
  static final String id = "signin_page";

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailController=TextEditingController();
  final passwordController=TextEditingController();


  _callSignUpPage() {
    Navigator.pushNamed(context, SignUp.id);
  }

  _doLogin() {
    String email=emailController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    var box = Hive.box('data');
    var user1=new User(email:email,password:password);
    box.put('user',user1.toJson());

    var user2=new User.fromJson(box.get('user'));

    print(user2.email);
    print(user2.password);



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
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/item_1.jpg"),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 20),
                      Text("Welcome",
                          style: TextStyle(
                              color: Color.fromRGBO(47, 175, 171, 1))),
                      SizedBox(height: 10),
                      Text("Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
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
                            SizedBox(height: 35),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 16)),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        'Forget Password?',
                        style: TextStyle(
                            color: Colors.grey.shade300, fontSize: 16),
                      ),

                      SizedBox(height: 20),

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
                              "Sign in",
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
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                              onTap: _callSignUpPage,
                              child: Text("Sign Up",
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
