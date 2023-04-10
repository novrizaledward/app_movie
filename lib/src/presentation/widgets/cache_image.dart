import 'package:app_movie/src/presentation/widgets/loading_circle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CacheImage(
      {super.key, required this.url, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) {
        return const Center(
          child: LoadingCircle(size: 20),
        );
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
      ),
    );
  }
}
