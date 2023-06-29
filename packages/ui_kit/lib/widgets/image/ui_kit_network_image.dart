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
      height: height,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
      placeholder: (context, url) => placeholder ?? const CircularProgressIndicator.adaptive(),
    );
  }
}
