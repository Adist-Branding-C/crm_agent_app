import 'spotlight_repository.dart';

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
    Spotlight(
      id: 's6',
      title: 'Vishnu Prasad document review',
      description: 'Pending document check',
    ),
  ];

  @override
  Future<List<Spotlight>> getSpotlights() async {
    return _mockSpotlights;
  }
}
