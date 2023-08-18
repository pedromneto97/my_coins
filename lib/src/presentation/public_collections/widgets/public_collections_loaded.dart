import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../../routes/app_router.dart';
import '../cubit/get_public_collections_cubit.dart';

class PublicCollectionsLoaded extends StatelessWidget {
  final List<Collection> collections;

  const PublicCollectionsLoaded({
    super.key,
    required this.collections,
  });

  void _onTapCollection(BuildContext context, Collection collection) => context.router.push(
        CollectionDetailsRoute(id: collection.id),
      );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<GetPublicCollectionsCubit>().load,
      child: ListView.builder(
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final collection = collections[index];

          return ListTile(
            title: Text(collection.name),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _onTapCollection(context, collection),
          );
        },
      ),
    );
  }
}
