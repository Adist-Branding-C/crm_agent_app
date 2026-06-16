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

/// Concrete implementation of [SpotlightRepository] with pre-seeded mock data.
class SpotlightRepositoryImpl implements SpotlightRepository {
  final List<Spotlight> _mockSpotlights = const [
    Spotlight(
      id: 's1',
      title: 'Sneha Pillai follow-up',
      description: 'High-priority call scheduled today',
    ),
    Spotlight(
      id: 's2',
      title: 'Lakshmi Warrier batch confirmation',
      description: 'Overdue confirmation slot',
    ),
    Spotlight(
      id: 's3',
      title: 'Enterprise deal paperwork',
      description: 'Pending document signing',
    ),
    Spotlight(
      id: 's4',
      title: 'Rahul Menon call back',
      description: 'Hot lead waiting for admission details',
    ),
    Spotlight(
      id: 's5',
      title: 'Aravind Krishnan campus visit',
      description: 'High-priority campus visit today',
    ),
  ];

  @override
  Future<List<Spotlight>> getSpotlights() async {
    return _mockSpotlights;
  }
}
