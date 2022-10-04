import 'package:flutter/material.dart';

class ContactEditScreen extends StatefulWidget {
  const ContactEditScreen({
    super.key,
    this.id,
  });

  final int? id;

  @override
  State<ContactEditScreen> createState() => _ContactEditScreenState();
}

class _ContactEditScreenState extends State<ContactEditScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // String? _firstNameErrorText;
  // String? _lastNameErrorText;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (builderContext) {
          // now we can do Form.of(builderContext), because builders context has form ancestor instance
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Form.of(builderContext)!.validate();
              },
            ),
          );
        },
      ),
    );
  }

  // _validateInputs() {
  //   _firstNameErrorText =
  //       _firstNameController.text.isEmpty ? "First name is required" : null;

  //   _lastNameErrorText =
  //       _lastNameController.text.isEmpty ? "Last name is required" : null;

  //   setState(() {});
  // }
}
