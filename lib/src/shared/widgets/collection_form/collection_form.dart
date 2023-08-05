import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/domain.dart';
import 'cubit/get_templates/get_templates_cubit.dart';
import 'widgets/collection_form_error.dart';
import 'widgets/collection_form_loaded.dart';

class CollectionForm extends StatelessWidget {
  final Collection? collection;

  const CollectionForm({
    super.key,
    this.collection,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTemplatesCubit>(
      create: (context) => GetIt.I.get<GetTemplatesCubit>()..getTemplates(),
      child: BlocBuilder<GetTemplatesCubit, GetTemplatesState>(
        builder: (context, state) {
          Widget child;
          if (state is GetTemplatesLoaded) {
            child = CollectionFormLoaded(
              templates: state.templates,
              collection: collection,
            );
          } else if (state is GetTemplatesError) {
            child = const CollectionFormError();
          } else {
            child = const Center(
              child: CircularProgressIndicator(),
            );
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: child,
          );
        },
      ),
    );
  }
}
