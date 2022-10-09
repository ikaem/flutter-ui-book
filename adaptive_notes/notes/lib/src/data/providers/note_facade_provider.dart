import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/services/note_facade.dart';
import 'package:notes/src/utils/constants.dart';
import 'package:notes/src/utils/helpers/device_type.dart';

final noteFacadeProvider = Provider<NoteFacade>((ref) {
  final baseUrl = isMobileDevice ? mobileDeviceApiUrl : nonMobileDeviceApiUrl;
  final options = BaseOptions(baseUrl: baseUrl);

// configuring dio isntance we pass to the facade - this is cool, we can inject possibly whatever we wnat here

  return NoteFacade(Dio(options));
});
