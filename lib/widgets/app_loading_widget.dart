import 'package:flutter/material.dart';
import '../theme.dart';
import 'package:flutter_sfs/flutter_sfs.dart';

/// A reusable loading spinner widget aligned with the app theme.
class AppLoadingWidget extends StatelessWidget {
  /// Optional custom size for the spinner.
    double? size;

  /// Creates an [AppLoadingWidget].
    AppLoadingWidget({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size?? 25.s,
        height: size?? 25.s,
        child:  CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 3.w,
        ),
      ),
    );
  }
}
