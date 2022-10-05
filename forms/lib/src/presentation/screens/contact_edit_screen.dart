import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:forms/src/models/contact.dart';
import 'package:forms/src/navigation/app_route_paths.dart';
import 'package:forms/src/navigation/app_router.dart';
import 'package:forms/src/presentation/controllers/contact_controller.dart';
import 'package:forms/src/utils/validators.dart';
import 'package:provider/provider.dart';

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
  // String? _firstNameErrorText;
  // String? _lastNameErrorText;

  // this is also fine
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  late final _contact = context
      .read<ContactController>()
      .contacts
      .firstWhereOrNull((element) => element.id == widget.id);

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    _firstNameController = TextEditingController(text: _contact?.firstName);
    _lastNameController = TextEditingController(text: _contact?.lastName);
    _emailController = TextEditingController(text: _contact?.emailAddress);
    _phoneController = TextEditingController(text: _contact?.phoneNumber);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

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
              onPressed: () async {
// what is this
                ScaffoldFeatureController? scaffoldFeatureController;

                final isValid = Form.of(builderContext)!.validate();
                if (!isValid) return;

                final controller = context.read<ContactController>();

                if (_contact == null) {
                  final newContact = Contact(
                    id: controller.contacts.length + 1,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    phoneNumber: _phoneController.text,
                    emailAddress: _emailController.text,
                  );

                  controller.addContact(newContact);
                  scaffoldFeatureController =
                      ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Successfully created contact")),
                  );

                  await scaffoldFeatureController.closed;

                  appRouter.goNamed(
                    AppRoutePaths.contactDetails,
                    params: {
                      "id": newContact.id.toString(),
                    },
                  );

                  return;
                }

                final updatedContact = _contact!.copyWith(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  emailAddress: _emailController.text,
                  phoneNumber: _phoneController.text,
                );

                controller.updateContact(updatedContact);

                scaffoldFeatureController =
                    ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Contact updated successfully"),
                  ),
                );

                await scaffoldFeatureController.closed;
                appRouter.pop();
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            // note that list view is a nice solution for scrolling
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      label: Text("First name"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      label: Text("Last name"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is reqired";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text("Email address"),
                        border: OutlineInputBorder(),
                      ),
                      validator: handleEmailValidation),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _phoneController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text("Phone numebr"),
                        border: OutlineInputBorder(),
                      ),
                      validator: handlePhoneValidation),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    Form.of(builderContext)!.reset();
                  },
                  child: const Text("Reset"),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String? handlePhoneValidation(String? value) {
    const failedValidationString = "Please provide a valid phone number";
    if (value == null) return failedValidationString;
    if (value.isEmpty) return failedValidationString;
    if (!isPhoneNumber(value)) return failedValidationString;

    return null;
  }

  String? handleEmailValidation(String? value) {
    const failedValidationString = "Please provide a valid emailAddress";
    if (value == null) return failedValidationString;
    if (value.isEmpty) return failedValidationString;
    if (!isEmail(value)) return failedValidationString;

    return null;
  }

  // _validateInputs() {
  //   _firstNameErrorText =
  //       _firstNameController.text.isEmpty ? "First name is required" : null;

  //   _lastNameErrorText =
  //       _lastNameController.text.isEmpty ? "Last name is required" : null;

  //   setState(() {});
  // }
}
