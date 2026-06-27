import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../../widgets/responsive_width_container.dart';
import 'enquiry_details_header.dart';
import 'tab_selector.dart';
import 'info_tab_view.dart';
import 'activities_tab_view.dart';
import 'notes_tab_view.dart';
import 'fab_menu.dart';

/// The loaded view containing the header, tab selector, tab contents and fab.
class EnquiryDetailsLoadedView extends StatefulWidget {
  final EnquiryDetailsLoaded state;
  const EnquiryDetailsLoadedView({super.key, required this.state});

  @override
  State<EnquiryDetailsLoadedView> createState() =>
      _EnquiryDetailsLoadedViewState();
}

class _EnquiryDetailsLoadedViewState extends State<EnquiryDetailsLoadedView> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidthContainer(
      maxWidth: 800.w,
      child: Stack(
        children: [
          Column(
            children: [
              const EnquiryDetailsHeader(),
              TabSelector(
                activeTab: _activeTab,
                onTabChanged: (val) => setState(() => _activeTab = val),
              ),
              Expanded(
                child: IndexedStack(
                  index: _activeTab,
                  children: [
                    InfoTabView(lead: widget.state.lead),
                    ActivitiesTabView(
                      activities: widget.state.activities,
                      lead: widget.state.lead,
                    ),
                    NotesTabView(notes: widget.state.notes),
                  ],
                ),
              ),
            ],
          ),
          const FabMenu(),
        ],
      ),
    );
  }
}
