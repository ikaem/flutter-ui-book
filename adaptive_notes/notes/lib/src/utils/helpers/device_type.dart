import 'dart:io';

import 'package:flutter/foundation.dart';

bool get isMobileDevice {
  if (kIsWeb) return false;
  if (Platform.isIOS) return true;
  if (Platform.isAndroid) return true;

  return false;
}

bool get isDesktopDevice {
  if (kIsWeb) return false;
  if (Platform.isWindows) return true;
  if (Platform.isLinux) return true;
  if (Platform.isMacOS) return true;

  return false;
}

bool get isWebOrMobileDevice {
  if (kIsWeb) return true;
  if (isMobileDevice) return true;

  return false;
}

bool get isWebOrDesktopDevice {
  if (kIsWeb) return true;
  if (isDesktopDevice) return true;

  return false;
}
