import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagesModal extends StatefulWidget {
  final List<String> images;
  final int initialPage;

  const ImagesModal({
    super.key,
    required this.images,
    this.initialPage = 0,
  });

  @override
  State<ImagesModal> createState() => _ImagesModalState();
}

class _ImagesModalState extends State<ImagesModal> {
  late final _controller = PageController(initialPage: widget.initialPage);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
          ),
          Expanded(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              pageController: _controller,
              builder: (BuildContext context, int index) {
                final image = widget.images[index];

                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(image),
                  heroAttributes: PhotoViewHeroAttributes(tag: image),
                );
              },
              itemCount: widget.images.length,
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
