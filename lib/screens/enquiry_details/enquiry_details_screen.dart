import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../bloc/call_log/call_log_bloc.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/enquiry_details_body.dart';

String _enquiryDetailsErrorString(EnquiryDetailsFailure f) {
  switch (f) {
    case EnquiryDetailsFailure.leadNotFound: return 'Lead not found';
    case EnquiryDetailsFailure.load: return 'Failed to load enquiry details';
    case EnquiryDetailsFailure.unknown: return 'An error occurred';
  }
}

/// Screen representing detail page for a single sales lead / enquiry.
class EnquiryDetailsScreen extends StatelessWidget {
  /// The ID of the lead to show.
  final String leadId;

  /// Creates a constant [EnquiryDetailsScreen].
  const EnquiryDetailsScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => EnquiryDetailsBloc(
        leadsRepository: c.read(),
        activityRepository: c.read(),
      )..add(LoadEnquiryDetails(leadId)),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EnquiryDetailsBloc, EnquiryDetailsState>(
            listener: (context, state) {
              if (state is EnquiryDetailsDeleted) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lead deleted successfully')),
                );
              } else if (state is EnquiryDetailsError &&
                  _enquiryDetailsErrorString(state.failureCode).toLowerCase().contains('not found')) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(_enquiryDetailsErrorString(state.failureCode))),
                );
              }
            },
          ),
          BlocListener<CallLogBloc, CallLogState>(
            listener: (context, state) {
              if (state is CallLogSaveSuccess) {
                context.read<EnquiryDetailsBloc>().add(LoadEnquiryDetails(leadId));
              }
            },
          ),
        ],
        child: PageScaffold(
          padding: EdgeInsets.zero,
          child: EnquiryDetailsBody(leadId: leadId),
        ),
      ),
    );
  }
}
