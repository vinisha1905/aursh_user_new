import 'package:ayursh/domain/constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ZoomImageScreen extends StatefulWidget {
  final int index;
  final List<String>? galleryImages;

  ZoomImageScreen({required this.index, this.galleryImages});

  @override
  _ZoomImageScreenState createState() => _ZoomImageScreenState();
}

class _ZoomImageScreenState extends State<ZoomImageScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) async {},
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: primaryGreenColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: PhotoViewGallery.builder(
              scrollPhysics: BouncingScrollPhysics(),
              enableRotation: false,
              backgroundDecoration: BoxDecoration(color: Colors.black54),
              pageController: PageController(initialPage: widget.index),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: Image.network(widget.galleryImages![index],
                      errorBuilder: (context, error, stackTrace) =>
                          SizedBox()).image,
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  errorBuilder: (context, error, stackTrace) => SizedBox(),
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: widget.galleryImages![index],
                  ),
                );
              },
              itemCount: widget.galleryImages!.length,
              loadingBuilder: (context, event) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
