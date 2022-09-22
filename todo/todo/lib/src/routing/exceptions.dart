import 'package:flutter/cupertino.dart';

class RouteException implements Exception {
  final String message;

  const RouteException({required this.message});
}
