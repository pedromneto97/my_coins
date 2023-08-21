import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../utils/filter_to_localized_text.dart';
import '../../cubit/filter.dart';
import 'cubit/filter_cubit.dart';

class FilterBottomSheet extends StatelessWidget {
  final Filter filter;

  const FilterBottomSheet({
    super.key,
    required this.filter,
  });

  void _onPressClear(BuildContext context) => Navigator.of(context).pop(Filter.all);

  void _onPressApply(BuildContext context) => Navigator.of(context).pop(
        context.read<FilterCubit>().state,
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterCubit>(
      create: (context) => GetIt.I.get<FilterCubit>(param1: filter),
      child: CustomBottomSheet(
        title: 'Filtros',
        child: Column(
          children: [
            BlocBuilder<FilterCubit, Filter>(
              builder: (context, state) => Column(
                children: [
                  RadioListTile<Filter>(
                    title: Text(Filter.rare.localizedText(context)),
                    value: Filter.rare,
                    groupValue: state,
                    onChanged: (value) => context.read<FilterCubit>().changeFilter(value!),
                  ),
                  RadioListTile<Filter>(
                    title: Text(Filter.missing.localizedText(context)),
                    value: Filter.missing,
                    groupValue: state,
                    onChanged: (value) => context.read<FilterCubit>().changeFilter(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) => Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _onPressClear(context),
                      child: const Text('Limpar'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => _onPressApply(context),
                      child: const Text('Aplicar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
