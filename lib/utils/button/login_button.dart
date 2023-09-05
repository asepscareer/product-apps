import 'package:product_apps/api/auth.dart';
import 'package:product_apps/models/user_info.dart';
import 'package:product_apps/utils/page/home_page.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String username;
  final String password;

  const LoginButton({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Future<UserInfo?> _validate() async {
    try {
      print("Ini dia " + widget.username);
      final result =
          await LoginResponse().validate(widget.username, widget.password);
      print(result?.token);
      return result;
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _validate();

          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return const Home();
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.blue[600],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
