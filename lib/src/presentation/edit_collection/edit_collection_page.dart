import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../../shared/widgets/collection_form/collection_form.dart';
import '../../shared/widgets/collection_form/cubit/upsert_collection/upsert_collection_cubit.dart';
import '../../utils/localizations.dart';
import 'cubit/update_collection_cubit.dart';

@RoutePage()
class EditCollectionPage extends StatelessWidget {
  final Collection collection;

  const EditCollectionPage({
    super.key,
    required this.collection,
  });

  void _onUpsertCollectionStateChange(context, state) {
    if (state is UpsertCollectionSuccess) {
      Navigator.of(context).pop();
      return;
    }
    if (state is UpsertCollectionError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.strings.failedToEditCollection),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpsertCollectionCubit>(
      create: (context) => GetIt.I.get<UpdateCollectionCubit>(param1: collection),
      child: BlocListener<UpsertCollectionCubit, UpsertCollectionState>(
        listener: _onUpsertCollectionStateChange,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.strings.editCollection),
          ),
          body: CollectionForm(collection: collection),
        ),
      ),
    );
  }
}
