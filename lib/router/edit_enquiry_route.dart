import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../screens/enquiry_details/edit_enquiry_screen.dart';
import 'app_routes.dart';

/// Builds the Edit Enquiry route with a custom right-to-left slide transition.
GoRoute buildEditEnquiryRoute() {
  return GoRoute(
    name: AppRoutes.editEnquiry,
    path: AppRoutes.editEnquiryPath,
    pageBuilder: (context, state) {
      final leadId = state.pathParameters['id'] ?? '';
      final extraBloc = state.extra as EnquiryDetailsBloc?;
      final child = extraBloc != null
          ? BlocProvider.value(
              value: extraBloc,
              child: EditEnquiryScreen(leadId: leadId),
            )
          : BlocProvider(
              create: (c) => EnquiryDetailsBloc(
                leadsRepository: c.read(),
                activityRepository: c.read(),
              )..add(LoadEnquiryDetails(leadId)),
              child: EditEnquiryScreen(leadId: leadId),
            );
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, anim, secAnim, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          );
        },
      );
    },
  );
}
