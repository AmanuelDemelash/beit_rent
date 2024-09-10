import 'package:flutter/material.dart';

class HeaderTextSpan extends StatelessWidget {
  const HeaderTextSpan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(children: [
      TextSpan(text: 'Hi,', style: TextStyle(fontSize: 17)),
      TextSpan(
          text: '\nDiscover your dream house',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
    ]));
  }
}