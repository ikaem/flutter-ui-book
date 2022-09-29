import 'package:flutter/material.dart';

class MaterialFormSection extends StatelessWidget {
  const MaterialFormSection({
    super.key,
    this.header,
    required this.children,
  });

  final Widget? header;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // this is interesting
    assert(children.isNotEmpty);

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (header != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
                child: Container(
                  child: header,
                ),
              ),
            ),
          ...children,
        ],
      ),
    );
  }
}
