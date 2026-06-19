import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../../widgets/app_loading_widget.dart';
import '../../../widgets/app_error_widget.dart';
import 'enquiry_details_loaded_view.dart';

String _enquiryDetailsErrorString(EnquiryDetailsFailure f) {
  switch (f) {
    case EnquiryDetailsFailure.leadNotFound: return 'Lead not found';
    case EnquiryDetailsFailure.load: return 'Failed to load enquiry details';
    case EnquiryDetailsFailure.unknown: return 'An error occurred';
  }
}

/// Renders the overall details screen body including tab routing.
class EnquiryDetailsBody extends StatelessWidget {
  /// The ID of the lead.
  final String leadId;

  /// Creates a constant [EnquiryDetailsBody].
  const EnquiryDetailsBody({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnquiryDetailsBloc, EnquiryDetailsState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is EnquiryDetailsLoading || state is EnquiryDetailsInitial) {
          return const Center(child: AppLoadingWidget());
        }
        if (state is EnquiryDetailsLoaded) {
          return EnquiryDetailsLoadedView(state: state);
        }
        if (state is EnquiryDetailsError) {
          return Center(
            child: AppErrorWidget(
              message: _enquiryDetailsErrorString(state.failureCode),
              onRetry: () => context.read<EnquiryDetailsBloc>().add(
                    LoadEnquiryDetails(leadId),
                  ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
