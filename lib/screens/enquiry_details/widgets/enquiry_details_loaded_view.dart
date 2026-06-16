import 'package:flutter/material.dart';
import 'enquiry_details_header.dart';
import 'tab_selector.dart';
import 'info_tab_view.dart';
import 'activities_tab_view.dart';
import 'notes_tab_view.dart';
import 'fab_menu.dart';

/// The loaded view containing the header, tab selector, tab contents and fab.
class EnquiryDetailsLoadedView extends StatefulWidget {
  const EnquiryDetailsLoadedView({super.key});

  @override
  State<EnquiryDetailsLoadedView> createState() =>
      _EnquiryDetailsLoadedViewState();
}

class _EnquiryDetailsLoadedViewState extends State<EnquiryDetailsLoadedView> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
}
