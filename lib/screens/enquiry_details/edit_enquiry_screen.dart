import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../widgets/app_loading_widget.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/edit_enquiry_form.dart';

/// Screen representing the dedicated full page for editing a lead's details.
class EditEnquiryScreen extends StatelessWidget {
  /// The ID of the lead.
  final String leadId;

  /// Creates a constant [EditEnquiryScreen].
  const EditEnquiryScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnquiryDetailsBloc, EnquiryDetailsState>(
      builder: (context, state) {
        if (state is EnquiryDetailsLoading || state is EnquiryDetailsInitial) {
          return const Scaffold(body: Center(child: AppLoadingWidget()));
        }
        if (state is EnquiryDetailsLoaded) {
          return PageScaffold(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ScreenHeader(
                  title: 'Edit Enquiry',
                  subtitle: state.lead.name,
                  showBackButton: true,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 12,
                    bottom: 4,
                  ),
                ),
                Expanded(child: EditEnquiryForm(lead: state.lead)),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(child: Text('Failed to load lead details')),
        );
      },
    );
  }
}
