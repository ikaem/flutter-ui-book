import 'package:flutter/material.dart';
import 'package:forms/src/models/models.dart';
import 'package:forms/src/navigation/app_route_paths.dart';
import 'package:forms/src/navigation/app_router.dart';
import 'package:forms/src/presentation/controllers/contact_controller.dart';
import 'package:provider/provider.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
/* note that here we need to provide callback to select - callback accepts state */
    final contact = context.select<ContactController, Contact?>(
      (controller) => controller.contacts.firstWhere(
        (element) => element.id == id,
      ),
    );

    if (contact == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("This contact does not exist"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact details"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => appRouter.pushNamed(
          AppRoutePaths.contactEdit,
          params: {
            "id": id.toString(),
          },
        ),
        label: const Text("Edit"),
        icon: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          ListTile(
            dense: true,
            title: const Text("Name"),
            subtitle: Text("${contact.firstName} ${contact.lastName}"),
          ),
          ListTile(
            dense: true,
            title: const Text("Phone"),
            subtitle: Text("${contact.firstName} ${contact.lastName}"),
          ),
          ListTile(
            dense: true,
            title: const Text("Email"),
            subtitle: Text("${contact.firstName} ${contact.lastName}"),
          ),
        ],
      ),
    );
  }
}
