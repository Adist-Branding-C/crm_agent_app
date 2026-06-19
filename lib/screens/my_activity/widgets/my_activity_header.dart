import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/my_activity/my_activity_bloc.dart';
import '../../../widgets/screen_header.dart';

/// Header displaying 'My Activity' title and total action count.
class MyActivityHeader extends StatelessWidget {
  const MyActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyActivityBloc, MyActivityState>(
      builder: (context, state) {
        final count = state is MyActivityLoaded ? state.totalCount : 0;
        return ScreenHeader(
          title: 'My Activity',
          subtitle: '$count actions',
          showBackButton: true,
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 16,
            bottom: 8,
          ),
        );
      },
    );
  }
}
