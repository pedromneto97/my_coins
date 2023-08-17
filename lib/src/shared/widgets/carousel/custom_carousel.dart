import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../images_modal/images_modal.dart';
import 'carousel_dots.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> images;
  final double imageHeight;

  const CustomCarousel({
    super.key,
    required this.images,
    required this.imageHeight,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final _controller = CarouselController();
  final _indexNotifier = ValueNotifier<int>(0);

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    _indexNotifier.value = index;
  }

  void _onTapImage(int index) {
    showDialog(
      context: context,
      builder: (context) => ImagesModal(
        images: widget.images,
        initialPage: index,
      ),
    );
  }

  @override
  void dispose() {
    _indexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, index, realIndex) => Ink.image(
            image: NetworkImage(widget.images[index]),
            fit: BoxFit.cover,
            width: double.infinity,
            height: widget.imageHeight,
            child: InkWell(
              onTap: () => _onTapImage(index),
              child: const Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.zoom_in),
                  ),
                ],
              ),
            ),
          ),
          options: CarouselOptions(
            viewportFraction: 0.5,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            onPageChanged: _onPageChanged,
            enableInfiniteScroll: false,
            height: widget.imageHeight,
          ),
          carouselController: _controller,
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<int>(
          valueListenable: _indexNotifier,
          builder: (context, currentIndex, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselDots(
              currentIndex: currentIndex,
              itemCount: widget.images.length,
            ),
          ),
        ),
      ],
    );
  }
}
