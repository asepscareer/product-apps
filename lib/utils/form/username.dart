import 'package:flutter/material.dart';

class UsernameForm extends StatefulWidget {
  final void Function(String) onUsernameChanged;

  const UsernameForm({Key? key, required this.onUsernameChanged})
      : super(key: key);

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  final TextEditingController _usernameInput = TextEditingController();

  @override
  void dispose() {
    _usernameInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameInput,
      keyboardType: TextInputType.name,
      onChanged: widget.onUsernameChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Username",
        prefixIcon: Icon(
          Icons.account_box,
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
