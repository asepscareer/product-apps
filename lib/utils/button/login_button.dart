import 'package:flutter/material.dart';
import 'package:product_apps/api/auth.dart';
import 'package:product_apps/utils/pages/home_page.dart';

class LoginButton extends StatelessWidget {
  final String username;
  final String password;

  const LoginButton({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  Future<String?> _validate() async {
    try {
      print("Ini dia " + username);
      final result = await LoginResponse().validate(username, password);
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
                return const HomePage();
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
