import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../widgets/call_button.dart';

class FollowUpCard extends StatelessWidget {
  final FollowUpCall call;

  const FollowUpCard({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    final isPriority = call.tag == FollowUpTag.priority;
    final tagBg = isPriority
        ? AppColors.primaryColorLight
        : AppColors.warningBackground;
    final tagText = isPriority ? AppColors.primaryColor : AppColors.warning;
    final displayName = call.name.replaceAll('Call back ', '').trim();

    return Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: tagBg,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        call.tag.label,
                        style: TextStyle(
                          color: tagText,
                          fontSize: 10.s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (call.isOverdue) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.errorBackground,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          'Overdue',
                          style: TextStyle(
                            color: AppColors.errorColor,
                            fontSize: 10.s,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                AppSpacing.gapSm,
                GestureDetector(
                  onTap: () => context.pushNamed(
                    AppRoutes.enquiryDetails,
                    pathParameters: {'id': call.id},
                  ),
                  child: Text(
                    displayName,
                    style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          fontSize: 15.s,
                        ),
                  ),
                ),
                AppSpacing.gapSm,
                Text(call.time, style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11.s,
                    )),
              ],
            ),
          ),
          AppSpacing.gapWSm,
          CallButton(
            onTap: () => context.read<CallLogBloc>().add(
              InitiateCallByName(name: displayName),
            ),
          ),
        ],
      ),
    );
  }
}
