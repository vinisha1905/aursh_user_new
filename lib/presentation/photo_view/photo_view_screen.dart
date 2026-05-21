import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ── Arguments ─────────────────────────────────────────────────────────────────
class PhotoViewArguments {
  final String source;   // local file path OR remote URL
  final bool isLocal;

  const PhotoViewArguments(this.source, {this.isLocal = false});
}

// ── Screen ────────────────────────────────────────────────────────────────────
class PhotoViewScreen extends StatelessWidget {
  static const String routName = '/photo-view';
  final PhotoViewArguments arguments;

  const PhotoViewScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLocal = arguments.isLocal ||
        arguments.source.startsWith('/') ||
        arguments.source.startsWith('file://');

    return Scaffold(
      backgroundColor: Colors.black,
      // Tap anywhere to close
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: PhotoView(
          imageProvider: isLocal
              ? FileImage(File(arguments.source))
              : CachedNetworkImageProvider(arguments.source)
          as ImageProvider,
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 3,
          backgroundDecoration: BoxDecoration(color: Colors.black),
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              value: event?.expectedTotalBytes != null
                  ? event!.cumulativeBytesLoaded / event.expectedTotalBytes!
                  : null,
            ),
          ),
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(Icons.broken_image_outlined,
                color: Colors.white54, size: 64),
          ),
        ),
      ),
    );
  }
}