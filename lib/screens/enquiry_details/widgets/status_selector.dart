import 'package:crm_agent_app/theme/app_colors.dart';
import 'package:crm_agent_app/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';

/// Shows a bottom sheet to select a new lead status.
void showStatusSelector(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (c) => SafeArea(
      child: Container(
        height: 540.h,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Change Status",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 16.s,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5.w,
              ),
            ),
            AppSpacing.gapLg,
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: LeadStatus.values
                    .map(
                      (s) => ListTile(
                        leading: Icon(
                          Icons.circle,
                          color: AppColors.primaryLightColor,
                          size: 9.s,
                        ),
                        title: Text(s.label, style: TextStyle(fontSize: 12.s)),
                        onTap: () {
                          context.read<EnquiryDetailsBloc>().add(
                            ChangeEnquiryStatus(s),
                          );
                          c.pop();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
