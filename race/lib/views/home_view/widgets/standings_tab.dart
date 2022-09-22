import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/localization/app_localization.dart';
import 'package:race/models/data_source.dart';
import 'package:race/styles/utils/breakpoints.dart';
import 'package:race/views/home_view/widgets/country_flag.dart';
import 'package:race/views/home_view/widgets/number_indicator.dart';

class StandingsTab extends StatelessWidget {
  const StandingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, dimensions) {
          // final wi

          final width =
              min<double>(maxStretchStandingsCards, dimensions.maxWidth);

          return SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: standingsList.length,
                itemBuilder: (context, index) {
                  final item = standingsList[index];

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('${context.l10n.winner}: ${item.points}'),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountryFlag(
                          countryCode: item.countryCode,
                          radius: 8,
                          width: 20,
                        ),
                      ],
                    ),
                    trailing: NumberIndicator(
                      number: index + 1,
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return const Divider(
                    thickness: 1,
                    height: 10,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
