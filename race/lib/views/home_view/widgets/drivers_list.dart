import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DriversList extends StatelessWidget {
  final List<ResultsEntry> results;

  const DriversList({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        final item = results[index];

        return ListTile(
          title: Text(item.surname),
          subtitle: Text(item.name),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CountryFlag(
                countryCode: item.countryCode,
                radius: 8,
                width: 20,
              ),
            ],
          ),
          // what is a number indicator
          trailing: NumberIndicator(
            number: index + 1,
          ),
        );
      },
    );
  }
}
