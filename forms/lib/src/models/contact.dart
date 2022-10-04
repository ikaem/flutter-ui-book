class Contact {
  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String emailAddress;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is! Contact) return false;

    if (other.id != id) return false;
    if (other.firstName != firstName) return false;
    if (other.lastName != lastName) return false;
    if (other.phoneNumber != phoneNumber) return false;
    if (other.emailAddress != emailAddress) return false;

    return true;
  }

  @override
  // TODO: implement hashCode
  int get hashCode {
    final hash = id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        emailAddress.hashCode;

    return hash;
  }

  @override
  String toString() {
    final string = """Contact(
      id: $id,
      firstName: $firstName,
      lastName: $lastName,
      phoneNumber: $phoneNumber,
      emailAddress: $emailAddress,
    )""";

    return string;
  }

  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? emailAddress,
  }) {
    return Contact(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }
}
