import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
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
          padding: EdgeInsets.fromLTRB(17.0.w, 25.0.h, 17.0.w, 13.0.h),
        );
      },
    );
  }
}
