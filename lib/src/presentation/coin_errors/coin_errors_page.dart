import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../utils/localizations.dart';

@RoutePage()
class CoinErrorsPage extends StatelessWidget {
  const CoinErrorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.coinErrors),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text(strings.invertedReverse),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              Text(strings.invertedReverseDescription),
            ],
          ),
          ExpansionTile(
            title: Text(strings.horizontalReverse),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              Text(strings.horizontalReverseDescription),
            ],
          ),
          ExpansionTile(
            title: Text(strings.doubleStrike),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              Text(strings.doubleStrikeDescription),
            ],
          ),
          ExpansionTile(
            title: Text(strings.offCenterCoin),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              Text(strings.offCenterCoinDescription),
            ],
          ),
          ExpansionTile(
            title: Text(strings.dieBreak),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              Text(strings.dieBreakDescription),
            ],
          ),
        ],
      ),
    );
  }
}
