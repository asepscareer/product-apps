import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  final void Function(String) onPasswordChanged;
  const PasswordForm({Key? key, required this.onPasswordChanged})
      : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _passwordInput = TextEditingController();

  @override
  void dispose() {
    _passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordInput,
      obscureText: true,
      onChanged: widget.onPasswordChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Password",
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
