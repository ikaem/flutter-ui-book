import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/utils/helpers/device_type.dart';

enum Layout {
  grid,
  list,
}

final layoutProvider = StateProvider((ref) {
  if (isMobileDevice) return Layout.list;
  return Layout.grid;
});
