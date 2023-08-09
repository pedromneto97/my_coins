import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../routes/app_router.dart';
import '../../../../utils/localizations.dart';
import 'cubit/add_coin/add_coin_cubit.dart';
import 'cubit/selected_photos/selected_photos_cubit.dart';
import 'cubit/selected_preservation/selected_preservation_cubit.dart';
import 'widgets/preservation_form.dart';

class AddCoinToCollection extends StatelessWidget {
  final String collectionId;
  final String coinId;

  const AddCoinToCollection({
    super.key,
    required this.coinId,
    required this.collectionId,
  });

  void _addPhotoFromCamera(BuildContext context) => context.read<SelectedPhotosCubit>().takePhoto();

  void _addPhotoFromGallery(BuildContext context) => context.read<SelectedPhotosCubit>().pickPhotos();

  void _addCoinToCollection(BuildContext context) => context.read<AddCoinCubit>().addCoin(
        photos: context.read<SelectedPhotosCubit>().state,
        preservation: context.read<SelectedPreservationCubit>().state,
      );

  void _onAddCoinStateChange(BuildContext context, AddCoinState state) {
    if (state is AddCoinSuccess) {
      context.router.popUntil((route) => route.settings.name == CollectionDetailsRoute.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    const imageSize = 160.0;

    final strings = context.strings;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<SelectedPhotosCubit>(),
        ),
        BlocProvider<AddCoinCubit>(
          create: (context) => GetIt.I.get<AddCoinCubit>(
            param1: collectionId,
            param2: coinId,
          ),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<SelectedPreservationCubit>(),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    strings.addCoinToCollection,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BlocBuilder<SelectedPhotosCubit, List<File>>(
              builder: (context, state) => state.isEmpty
                  ? const Icon(
                      Icons.image,
                      size: imageSize,
                    )
                  : CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) => Image.file(
                        state[index],
                        height: imageSize,
                        width: imageSize,
                      ),
                      itemCount: state.length,
                      options: CarouselOptions(
                        viewportFraction: 0.4,
                        enlargeCenterPage: true,
                        height: imageSize,
                        enlargeFactor: 0.4,
                        enableInfiniteScroll: false,
                      ),
                    ),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) => Row(
                children: [
                  const Expanded(
                    child: PreservationForm(),
                  ),
                  const SizedBox(width: 8),
                  IconButton.outlined(
                    onPressed: () => _addPhotoFromGallery(context),
                    icon: const Icon(Icons.add_photo_alternate_outlined),
                  ),
                  const SizedBox(width: 8),
                  IconButton.outlined(
                    onPressed: () => _addPhotoFromCamera(context),
                    icon: const Icon(Icons.add_a_photo_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            BlocConsumer<AddCoinCubit, AddCoinState>(
              listener: _onAddCoinStateChange,
              builder: (context, state) {
                if (state is AddCoinLoading) {
                  return const FilledButton(
                    onPressed: null,
                    child: CircularProgressIndicator(),
                  );
                }

                return FilledButton.icon(
                  onPressed: () => _addCoinToCollection(context),
                  label: Text(
                    context.strings.addCoinToCollection,
                  ),
                  icon: const Icon(Icons.add),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
