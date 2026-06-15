import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/follow_ups/follow_ups_bloc.dart';
import '../../theme.dart';
import 'widgets/follow_up_header.dart';
import 'widgets/follow_up_list_body.dart';

/// Screen listing all categorised follow-up calls.
class FollowUpsScreen extends StatelessWidget {
  /// Creates a constant [FollowUpsScreen].
  const FollowUpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowUpsBloc()..add(const LoadFollowUps()),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: BlocListener<FollowUpsBloc, FollowUpsState>(
            listener: (context, state) {
              if (state is FollowUpsLoaded && state.callingName != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Calling ${state.callingName}...'),
                    backgroundColor: AppColors.primaryColor,
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Column(
              children: [
                const FollowUpHeader(),
                Expanded(
                  child: BlocBuilder<FollowUpsBloc, FollowUpsState>(
                    builder: (context, state) {
                      if (state is FollowUpsLoading || state is FollowUpsInitial) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        );
                      }
                      if (state is FollowUpsLoaded) {
                        return FollowUpListBody(calls: state.followUps);
                      }
                      final msg = state is FollowUpsError
                          ? state.errorMessage
                          : 'Error';
                      return Center(
                        child: Text(
                          msg,
                          style: const TextStyle(color: AppColors.errorColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
