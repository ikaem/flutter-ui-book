import 'package:flutter/cupertino.dart';
import 'package:forms/src/models/models.dart';

final _initialContact = Contact(
  id: 1,
  firstName: "John",
  lastName: "Smith",
  phoneNumber: "444444",
  emailAddress: "john@something.com",
);

class ContactController extends ChangeNotifier {
  final List<Contact> _contacts = [
    _initialContact,
  ];

  List<Contact> get contacts => List.unmodifiable(_contacts);

  void addContact(Contact newContact) {
    _contacts.add(newContact);

    notifyListeners();
  }

  void deleteContact(int id) {
    _contacts.removeWhere((element) => element.id == id);

    notifyListeners();
  }

  void updateContact(Contact updatedContact) {
    // we could copy too

    // _contacts = _contacts.map((contact) {
    //   if (contact.id == updatedContact.id) return updatedContact;

    //   return contact;
    // });

    for (Contact contact in _contacts) {
      if (contact.id == updatedContact.id) contact = updatedContact;
    }

    notifyListeners();
  }
}
