import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
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
          return  Scaffold(body: Center(child: AppLoadingWidget()));
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
                  padding:  EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 22.h,
                    bottom: 4.h,
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
