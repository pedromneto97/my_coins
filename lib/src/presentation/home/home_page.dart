import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../utils/localizations.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onTapProfile(BuildContext context) => context.router.push(const ProfileRoute());

  void _onTapMyCollection(BuildContext context) {}

  void _onTapCollections(BuildContext context) {}

  void _onTapAddCollection(BuildContext context) => context.router.push(const CreateCollectionRoute());

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.welcome),
      ),
      body: Column(
        children: [
          const Divider(),
          ListTile(
            title: Text(strings.myCollections),
            subtitle: Text(strings.myCollectionsDescription),
            leading: const Icon(Icons.collections_bookmark_rounded),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            title: Text(strings.collections),
            subtitle: Text(strings.collectionsDescription),
            leading: const Icon(Icons.list),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            title: Text(strings.profile),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => _onTapProfile(context),
          ),
          const Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTapAddCollection(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
