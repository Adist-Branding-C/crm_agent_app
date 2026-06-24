import 'package:equatable/equatable.dart';

/// Representation of a spotlight or flagged item.
class Spotlight extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isFlagged;

  /// Creates a constant [Spotlight] item.
  const Spotlight({
    required this.id,
    required this.title,
    required this.description,
    this.isFlagged = true,
  });

  @override
  List<Object?> get props => [id, title, description, isFlagged];
}

/// Repository interface managing Spotlights.
abstract class SpotlightRepository {
  /// Fetches all spotlights/flagged items.
  Future<List<Spotlight>> getSpotlights();
}
