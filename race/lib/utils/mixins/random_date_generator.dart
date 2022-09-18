import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

mixin RandomDateGenerator {
// mixin RandomDateGenerator on Widget {
  String get randomDate {
    final random = Random();
    final month = random.nextInt(12) + 1;
    final day = random.nextInt(27) + 1;

    return DateFormat("dd MMMM y").format(DateTime(2022, month, day));
  }
}
