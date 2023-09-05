import 'package:product_apps/utils/button/login_button.dart';
import 'package:product_apps/utils/form/username.dart';
import 'package:product_apps/utils/form/password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleUsernameChanged(String value) {
    setState(() {
      _usernameController.text = value;
    });
  }

  void handlePasswordChanged(String value) {
    setState(() {
      _passwordController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[800] ?? Colors.blue,
                Colors.blue[400] ?? Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        height: 5.0,
                        // decoration: const BoxDecoration(color: Colors.white),
                      ),
                      const Text(
                        "Smart Travel Live Better",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UsernameForm(onUsernameChanged: handleUsernameChanged),
                        Container(
                          height: 20.0,
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                        PasswordForm(onPasswordChanged: handlePasswordChanged),
                        Container(
                          height: 10.0,
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot password",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.blue[800],
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50.0,
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                        LoginButton(
                          username: _usernameController.text,
                          password: _passwordController.text,
                        ),
                        Container(
                          height: 80.0,
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Logic
                          },
                          child: Text(
                            "Don't have an Account? Register now",
                            style: TextStyle(
                              color: Colors.blue[800],
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
