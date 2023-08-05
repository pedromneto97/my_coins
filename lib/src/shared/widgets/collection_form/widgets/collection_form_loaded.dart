import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/domain.dart';
import '../../../../utils/localizations.dart';
import '../cubit/public_collection/public_collection_cubit.dart';
import '../cubit/selected_template/selected_template_cubit.dart';
import '../cubit/upsert_collection/upsert_collection_cubit.dart';

class CollectionFormLoaded extends StatefulWidget {
  final List<CollectionTemplate> templates;
  final Collection? collection;

  const CollectionFormLoaded({
    super.key,
    required this.templates,
    this.collection,
  });

  @override
  State<CollectionFormLoaded> createState() => _CollectionFormLoadedState();
}

class _CollectionFormLoadedState extends State<CollectionFormLoaded> {
  late final collectionName = TextEditingController(text: widget.collection?.name);
  final _formKey = GlobalKey<FormState>();

  void _onChangedSelectedTemplate(BuildContext context, CollectionTemplate? template) {
    collectionName.text = '${template?.defaultName} - $_userFirstName';
  }

  String get _userFirstName => FirebaseAuth.instance.currentUser!.displayName?.split(' ').first ?? '';

  String? _validateCollectionName(String? name) => name?.isEmpty ?? true ? context.strings.requiredField : null;

  String? _validateTemplate(CollectionTemplate? template) => template == null ? context.strings.requiredField : null;

  void _onSubmitCollection(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      final template = context.read<SelectedTemplateCubit>().state;
      context.read<UpsertCollectionCubit>().upsertCollection(
            templateId: template!.id,
            name: collectionName.text,
            isPublic: context.read<PublicCollectionCubit>().state,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      for (final template in widget.templates)
        DropdownMenuItem(
          value: template,
          child: Text(template.defaultName),
        ),
    ];

    final strings = context.strings;

    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectedTemplateCubit>(
          create: (context) => GetIt.I.get<SelectedTemplateCubit>(
            param1: widget.templates.firstWhereOrNull((element) => element.id == widget.collection?.templateId),
          ),
        ),
        BlocProvider<PublicCollectionCubit>(
          create: (context) => GetIt.I.get(param1: widget.collection?.isPublic ?? false),
        ),
      ],
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<SelectedTemplateCubit, CollectionTemplate?>(
                builder: (context, state) => DropdownButtonFormField<CollectionTemplate?>(
                  items: items,
                  onChanged: widget.collection == null ? context.read<SelectedTemplateCubit>().changeTemplate : null,
                  value: state,
                  validator: _validateTemplate,
                ),
              ),
              BlocConsumer<SelectedTemplateCubit, CollectionTemplate?>(
                listener: _onChangedSelectedTemplate,
                builder: (context, selectedTemplate) {
                  final areFieldsEnabled = selectedTemplate != null;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: collectionName,
                        decoration: InputDecoration(
                          labelText: context.strings.collectionName,
                        ),
                        validator: _validateCollectionName,
                        enabled: areFieldsEnabled,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(strings.publicCollection),
                              const SizedBox(width: 8),
                              Tooltip(
                                message: strings.beingPublicCollection,
                                triggerMode: TooltipTriggerMode.tap,
                                showDuration: const Duration(seconds: 5),
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(16),
                                child: const Icon(Icons.help_outline),
                              ),
                            ],
                          ),
                          BlocBuilder<PublicCollectionCubit, bool>(
                            builder: (context, state) {
                              return Switch.adaptive(
                                value: state,
                                onChanged: areFieldsEnabled ? context.read<PublicCollectionCubit>().changePublic : null,
                              );
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => _onSubmitCollection(context),
                        child: Text(
                          strings.createCollection,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
