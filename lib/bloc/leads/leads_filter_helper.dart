import 'leads_enums.dart';
import 'leads_models.dart';

/// Applies query search, category chips, spotlight toggle, status selection,
/// source selection, and sorting to the leads dataset.
List<Lead> applyLeadsFilteringAndSorting(
  List<Lead> all, {
  required String query,
  required LeadCategory? category,
  required bool spotlight,
  required SortLeadsBy sortBy,
  LeadStatus? status,
  LeadSource? source,
}) {
  var filtered = all;

  // 1. Spotlight Filter (Only Hot leads)
  if (spotlight) {
    filtered = filtered.where((l) => l.category == LeadCategory.hot).toList();
  }

  // 2. Category Tab Filter
  if (category != null) {
    filtered = filtered.where((l) => l.category == category).toList();
  }

  // 3. Status Filter
  if (status != null) {
    filtered = filtered.where((l) => l.status == status).toList();
  }

  // 4. Source Filter
  if (source != null) {
    filtered = filtered.where((l) => l.leadSource == source).toList();
  }

  // 5. Query Search
  if (query.isNotEmpty) {
    final q = query.toLowerCase();
    filtered = filtered.where((l) =>
        l.name.toLowerCase().contains(q) ||
        l.phone.contains(q) ||
        l.location.toLowerCase().contains(q)).toList();
  }

  // 6. Sorting
  if (sortBy == SortLeadsBy.oldest) {
    filtered = List.from(filtered)
      ..sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
  } else if (sortBy == SortLeadsBy.alphabetical) {
    filtered = List.from(filtered)
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  } else if (sortBy == SortLeadsBy.followUp) {
    filtered = List.from(filtered)
      ..sort((a, b) {
        final hasA = a.nextFollowUp != null && a.nextFollowUp!.isNotEmpty;
        final hasB = b.nextFollowUp != null && b.nextFollowUp!.isNotEmpty;
        if (hasA && !hasB) return -1;
        if (!hasA && hasB) return 1;
        return int.parse(a.id).compareTo(int.parse(b.id));
      });
  } else {
    // Default: SortLeadsBy.newest (Sort by id descending)
    filtered = List.from(filtered)
      ..sort((a, b) => int.parse(b.id).compareTo(int.parse(a.id)));
  }

  return filtered;
}
