import 'package:equatable/equatable.dart';

enum CampaignType {
  call('Call'),
  whatsApp('WhatsApp'),
  email('Email');

  final String label;
  const CampaignType(this.label);
}

class Campaign extends Equatable {
  final String id;
  final String title;
  final CampaignType type;
  final String creator;
  final int doneCount;
  final int totalCount;

  const Campaign({
    required this.id,
    required this.title,
    required this.type,
    required this.creator,
    required this.doneCount,
    required this.totalCount,
  });

  int get remainingCount => totalCount - doneCount;

  int get progressPercent {
    if (totalCount == 0) return 0;
    return ((doneCount / totalCount) * 100).round();
  }

  bool get isCompleted => doneCount == totalCount;

  @override
  List<Object?> get props => [id, title, type, creator, doneCount, totalCount];
}
