import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/localizations.dart';
import '../../templates/error_template.dart';
import '../cubit/get_templates/get_templates_cubit.dart';

class CollectionFormError extends StatelessWidget {
  const CollectionFormError({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return ErrorTemplate(
      title: strings.failedToLoadPage,
      message: strings.checkYouConnectionAndTryAgain,
      onRetry: context.read<GetTemplatesCubit>().getTemplates,
    );
  }
}
