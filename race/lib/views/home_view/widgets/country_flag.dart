import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryFlag extends StatelessWidget {
  final double radius;
  final String countryCode;
  final double? width;

  const CountryFlag({
    required this.countryCode,
    this.radius = 0,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Image.asset("assets/flags/$countryCode.png"),
    );
  }
}
