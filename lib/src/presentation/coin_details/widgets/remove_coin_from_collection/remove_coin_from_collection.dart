import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/domain.dart';
import '../../../../routes/app_router.dart';
import '../../../../utils/localizations.dart';
import 'cubit/remove_coin_cubit.dart';

class RemoveCoinFromCollection extends StatelessWidget {
  final String collectionId;
  final CollectionCoin coin;

  const RemoveCoinFromCollection({
    super.key,
    required this.coin,
    required this.collectionId,
  });

  void _onRemoveCoinStateChange(BuildContext context, RemoveCoinState state) {
    if (state is RemoveCoinSuccess) {
      context.router.popUntil((route) => route.settings.name == CollectionDetailsRoute.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocProvider(
      create: (context) => GetIt.I.get<RemoveCoinCubit>(
        param1: coin,
        param2: collectionId,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    strings.confirmRemoveCoin,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text(strings.no),
                  ),
                ),
                const SizedBox(width: 8),
                BlocConsumer<RemoveCoinCubit, RemoveCoinState>(
                  listener: _onRemoveCoinStateChange,
                  builder: (context, state) {
                    final isLoading = state is RemoveCoinLoading;

                    return Expanded(
                      child: FilledButton(
                        onPressed: isLoading ? null : context.read<RemoveCoinCubit>().removeCoin,
                        child: isLoading ? const CircularProgressIndicator() : Text(strings.yes),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
