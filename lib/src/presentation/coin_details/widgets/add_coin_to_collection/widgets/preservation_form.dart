import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/domain.dart';
import '../../../../../utils/localizations.dart';
import '../../../../../utils/preservation_to_localized_text.dart';
import '../cubit/selected_preservation/selected_preservation_cubit.dart';

class PreservationForm extends StatelessWidget {
  const PreservationForm({super.key});

  String? _validatePreservation(BuildContext context, Preservation? value) {
    if (value == null) {
      return context.strings.requiredField;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      for (final preservation in Preservation.values)
        DropdownMenuItem(
          value: preservation,
          child: Text(preservation.toLocalizedString(context)),
        ),
    ];

    return BlocBuilder<SelectedPreservationCubit, Preservation>(
      builder: (context, state) => DropdownButtonFormField<Preservation>(
        items: items,
        onChanged: (value) => context.read<SelectedPreservationCubit>().onChangePreservation(value!),
        validator: (value) => _validatePreservation(context, value),
        value: state,
        decoration: InputDecoration(
          labelText: context.strings.preservation,
        ),
      ),
    );
  }
}
