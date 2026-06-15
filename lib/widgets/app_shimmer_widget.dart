import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A shimmer placeholder loading effect for content skeletons.
class AppShimmerWidget extends StatelessWidget {
  /// The width of the shimmer box.
  final double width;

  /// The height of the shimmer box.
  final double height;

  /// Corner border radius.
  final double borderRadius;

  /// Optional shape override (defaults to rounded rect).
  final BoxShape shape;

  /// Creates an [AppShimmerWidget].
  const AppShimmerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
    this.shape = BoxShape.rectangle,
  });

  /// Shimmer container helper for list views and card layouts.
  factory AppShimmerWidget.card({Key? key, double height = 100}) {
    return AppShimmerWidget(
      key: key,
      width: double.infinity,
      height: height,
      borderRadius: 16,
    );
  }

  /// Shimmer line helper for simulating text lines.
  factory AppShimmerWidget.line({
    Key? key,
    double width = double.infinity,
    double height = 12,
  }) {
    return AppShimmerWidget(
      key: key,
      width: width,
      height: height,
      borderRadius: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE2E8F0),
      highlightColor: const Color(0xFFF1F5F9),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
