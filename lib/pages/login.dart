import 'package:flutter/material.dart';
import 'package:login_authentication/function/auth_fun.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Authentication Email/Password",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      key: ValueKey("username"),
                      decoration: InputDecoration(hintText: "Enter Username"),
                      validator: (value) {
                        if ((!(value.toString().length > 3))) {
                          return "the length too short";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                    )
                  : Container(),
              TextFormField(
                key: ValueKey("email"),
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if ((!(value.toString().contains('@')))) {
                    return "Invalid email id";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey("passowrd"),
                decoration: InputDecoration(hintText: "Enter Passowrd"),
                validator: (value) {
                  if ((!(value.toString().length > 6))) {
                    return "the password too short";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),

              SizedBox(height: 10),
              // ignore: avoid_unnecessary_containers
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (isLogin) {
                        signIn(email, password);
                      } else {
                        signUp(email, password);
                      }
                    }
                  },
                  child: isLogin ? Text("Login") : Text("Sign Up"),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: isLogin
                    ? Text("Don't have an account signup")
                    : Text('Already Signed Up? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
