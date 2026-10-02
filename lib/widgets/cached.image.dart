import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCacheManager {
  static final CacheManager instance = CacheManager(
    Config(
      'app_image_cache',
      stalePeriod: const Duration(days: 10),
      maxNrOfCacheObjects: 200,
    ),
  );
}

/// ================= CACHE MANAGER =================

/// ================= REUSABLE IMAGE WIDGET =================
class AppCachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _error();
    }

    final image = CachedNetworkImage(
      imageUrl: imageUrl!,
      cacheManager: AppCacheManager.instance,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) => placeholder ?? _loading(),
      errorWidget: (_, __, ___) => errorWidget ?? _error(),
    );

    return borderRadius != null
        ? ClipRRect(borderRadius: borderRadius!, child: image)
        : image;
  }

  Widget _loading() => Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    child: const CircularProgressIndicator(strokeWidth: 2),
  );

  Widget _error() => Container(
    width: width,
    height: height,
    color: Colors.grey.shade200,
    alignment: Alignment.center,
    child: const Icon(Icons.image_not_supported),
  );
}
