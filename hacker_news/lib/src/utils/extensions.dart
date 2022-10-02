import 'package:hacker_news/src/utils/enums.dart';

extension StoryTypeExtension on StoryType {
  String get displayName {
    final name = this.name.replaceFirst("Stories", "");
    final firstLetter = name[0].toUpperCase();
    final rest = name.substring(1, name.length);
    final displayName = "$firstLetter$rest";

    return displayName;
  }
}
