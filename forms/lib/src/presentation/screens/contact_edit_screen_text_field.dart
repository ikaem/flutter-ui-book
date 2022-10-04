import 'package:flutter/material.dart';

class ContactEditScreenTextField extends StatefulWidget {
  const ContactEditScreenTextField({
    super.key,
    this.id,
  });

  final int? id;

  @override
  State<ContactEditScreenTextField> createState() =>
      _ContactEditScreenTextFieldState();
}

class _ContactEditScreenTextFieldState
    extends State<ContactEditScreenTextField> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String? _firstNameErrorText;
  String? _lastNameErrorText;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null ? "Create contact" : "Edit contact"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _validateInputs();
        },
        label: const Text("Create contact"),
        icon: const Icon(Icons.add),
      ),

      // body: const Center(
      //   child: Text("This is editing contact"),
      // ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              controller: _firstNameController,
              textInputAction: TextInputAction.next,
              // this is default
              // textInputAction: TextInputAction.done,
              // but only if keyboard type is not multiline
              // keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                label: const Text("First name"),
                border: const OutlineInputBorder(),
                errorText: _firstNameErrorText,
              ),
              // onChanged: (value) {
              //   _firstNameErrorText =
              //       value.isEmpty ? "First name is required" : null;

              //   setState(() {});
              // },
              // onSubmitted: (value) {
              //   _firstNameErrorText =
              //       value.isEmpty ? "First name is required" : null;

              //   setState(() {});
              // },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                label: const Text("Last name"),
                border: const OutlineInputBorder(),
                errorText: _lastNameErrorText,
              ),
              // onSubmitted: (value) {
              //   _lastNameErrorText =
              //       value.isEmpty ? "Last name is required" : null;

              //   setState(() {});
              // },
            ),
          ),
        ],
      ),
    );
  }

  _validateInputs() {
    _firstNameErrorText =
        _firstNameController.text.isEmpty ? "First name is required" : null;

    _lastNameErrorText =
        _lastNameController.text.isEmpty ? "Last name is required" : null;

    setState(() {});
  }
}
