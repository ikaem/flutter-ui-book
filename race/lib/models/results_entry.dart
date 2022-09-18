class ResultsEntry {
  final String name;
  final String lastName;
  final String countryCode;
  final int position;
  final String circuitName;

  const ResultsEntry({
    required this.name,
    required this.lastName,
    required this.countryCode,
    required this.position,
    required this.circuitName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

// is! is cool
// is is basically intanceof
    if (other is! ResultsEntry) return false;

    // runtime type is basically here this.runtimeZype
    // runtime type can be the type that extends this one
    if (runtimeType != other.runtimeType) return false;
    if (name != other.name) return false;
    if (lastName != other.lastName) return false;
    if (countryCode != other.countryCode) return false;
    if (position != other.position) return false;

    return true;
  }

  // this is needed for identical i think
  @override
  int get hashCode {
    int result = 17;

    result = result * 37 + name.hashCode;
    result = result * 37 + lastName.hashCode;
    result = result * 37 + countryCode.hashCode;
    result = result * 37 + position.hashCode;

    return result;
  }
}
