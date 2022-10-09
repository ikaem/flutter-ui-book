class NoteFormData {
  const NoteFormData({this.content, this.title});

  final String? content;
  final String? title;

  NoteFormData copyWith({
    String? content,
    String? title,
  }) {
    return NoteFormData(
      content: content ?? this.content,
      title: title ?? this.title,
    );
  }

// this is manual handling of equality - why, when we have equatable

  @override
  String toString() {
    return "NoteFormData(content: $content, title: $title)";
  }

  @override
  bool operator ==(Object other) {
    // identical function checks for reference
    if (identical(this, other)) return true;

    if (other is! NoteFormData) return false;
    if (other.content != content) return false;
    if (other.title != title) return false;

    return true;
  }

  @override
  int get hashCode => content.hashCode ^ title.hashCode;
}
