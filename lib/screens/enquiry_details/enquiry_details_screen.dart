import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../bloc/call_log/call_log_bloc.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/enquiry_details_body.dart';

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
                  state.message.toLowerCase().contains('not found')) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
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
