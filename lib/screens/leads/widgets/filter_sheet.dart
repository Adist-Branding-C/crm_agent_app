import 'package:flutter/material.dart';
import '../../../../bloc/leads/leads_enums.dart';
import 'filter_sheet_body.dart';

/// Modal bottom sheet allowing users to set filter and sort preferences.
class FilterSheet extends StatefulWidget {
  /// Selected sorting criterion on sheet load.
  final SortLeadsBy initialSortBy;

  /// Selected status criterion on sheet load.
  final LeadStatus? initialStatus;

  /// Selected source criterion on sheet load.
  final LeadSource? initialSource;

  /// Creates a constant [FilterSheet].
  const FilterSheet({
    super.key,
    required this.initialSortBy,
    this.initialStatus,
    this.initialSource,
  });

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late SortLeadsBy _sortBy;
  LeadStatus? _status;
  LeadSource? _source;

  @override
  void initState() {
    super.initState();
    _sortBy = widget.initialSortBy;
    _status = widget.initialStatus;
    _source = widget.initialSource;
  }

  @override
  Widget build(BuildContext context) {
    return FilterSheetBody(
      sortBy: _sortBy,
      status: _status,
      source: _source,
      onSortChanged: (val) => setState(() => _sortBy = val),
      onStatusChanged: (val) => setState(() => _status = val),
      onSourceChanged: (val) => setState(() => _source = val),
    );
  }
}
