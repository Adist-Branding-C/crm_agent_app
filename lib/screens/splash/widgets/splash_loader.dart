import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../bloc/splash/splash_bloc.dart';
import '../../../widgets/app_loading_widget.dart';

/// Loading indicator element displayed at the bottom of the splash screen.
class SplashLoader extends StatelessWidget {
  /// Creates a constant [SplashLoader] widget.
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is SplashLoading) {
          return  SizedBox(
            width: 24.w,
            height: 24.h,
            child: AppLoadingWidget(size: 24.s),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
