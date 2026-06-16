import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../../widgets/app_loading_widget.dart';
import '../../../widgets/app_error_widget.dart';
import 'enquiry_details_header.dart';
import 'tab_selector.dart';
import 'info_tab_view.dart';
import 'activities_tab_view.dart';
import 'notes_tab_view.dart';
import 'fab_menu.dart';

/// Renders the overall details screen body including tab routing.
class EnquiryDetailsBody extends StatefulWidget {
  /// The ID of the lead.
  final String leadId;

  /// Creates a constant [EnquiryDetailsBody].
  const EnquiryDetailsBody({super.key, required this.leadId});

  @override
  State<EnquiryDetailsBody> createState() => _EnquiryDetailsBodyState();
}

class _EnquiryDetailsBodyState extends State<EnquiryDetailsBody> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnquiryDetailsBloc, EnquiryDetailsState>(
      builder: (context, state) {
        if (state is EnquiryDetailsLoading || state is EnquiryDetailsInitial) {
          return const Center(child: AppLoadingWidget());
        }
        if (state is EnquiryDetailsLoaded) {
          return Stack(
            children: [
              Column(
                children: [
                  EnquiryDetailsHeader(lead: state.lead),
                  TabSelector(
                    activeTab: _activeTab,
                    onTabChanged: (val) => setState(() => _activeTab = val),
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _activeTab,
                      children: const [
                        InfoTabView(),
                        ActivitiesTabView(),
                        NotesTabView(),
                      ],
                    ),
                  ),
                ],
              ),
              const FabMenu(),
            ],
          );
        }
        if (state is EnquiryDetailsError) {
          return Center(
            child: AppErrorWidget(
              message: state.message,
              onRetry: () => context.read<EnquiryDetailsBloc>().add(
                    LoadEnquiryDetails(widget.leadId),
                  ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
