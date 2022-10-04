import 'package:flutter/material.dart';
import 'package:forms/src/navigation/app_route_paths.dart';
import 'package:forms/src/navigation/app_router.dart';
import 'package:forms/src/presentation/controllers/contact_controller.dart';
import 'package:provider/provider.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactController>().contacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          appRouter.pushNamed(AppRoutePaths.contactNew);
        },
        icon: const Icon(Icons.add),
        label: const Text("Create contact"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return ListTile(
            title: Text("${contact.firstName} ${contact.lastName}"),
            leading: CircleAvatar(
              child: Text(contact.firstName.characters.first),
            ),
            onTap: () => appRouter.pushNamed(
              AppRoutePaths.contactEdit,
              params: {
                "id": contact.id.toString(),
              },
            ),
          );
        },
      ),
    );
  }
}
