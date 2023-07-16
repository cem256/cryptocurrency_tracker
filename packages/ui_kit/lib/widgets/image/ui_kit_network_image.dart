import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UIKitNetworkImage extends StatelessWidget {
  final double? height;
  final String imageUrl;
  final Widget? errorWidget;
  final Widget? placeholder;

  const UIKitNetworkImage({super.key, this.height, required this.imageUrl, this.errorWidget, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      memCacheWidth: 100,
      memCacheHeight: 100,
      maxHeightDiskCache: 100,
      maxWidthDiskCache: 100,
      height: height,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
      placeholder: (context, url) => Center(child: placeholder ?? const CircularProgressIndicator.adaptive()),
    );
  }
}
