import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoInputField extends StatefulWidget {
  const TodoInputField({
    super.key,
    required this.onSubmitted,
  });

  final Function(String value) onSubmitted;

  @override
  State<TodoInputField> createState() => _TodoInputFieldState();
}

class _TodoInputFieldState extends State<TodoInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.done,
      decoration:
          const InputDecoration.collapsed(hintText: "What needs to be done"),
      onSubmitted: (String value) {
        widget.onSubmitted(value);
        _controller.clear();
      },
    );
  }
}
