import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represents the channel type of a campaign.
enum CampaignType {
  call('Call'),
  whatsApp('WhatsApp'),
  email('Email');

  final String label;
  const CampaignType(this.label);
}

/// Represents a single Campaign metric and status.
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

  /// The number of items remaining to process.
  int get remainingCount => totalCount - doneCount;

  /// The percentage completion rounded to integer.
  int get progressPercent {
    if (totalCount == 0) return 0;
    return ((doneCount / totalCount) * 100).round();
  }

  /// Whether the campaign has been completed.
  bool get isCompleted => doneCount == totalCount;

  /// Theme color associated with the campaign type/completion.
  Color get themeColor {
    if (isCompleted) return const Color(0xFF10B981); // Green
    switch (type) {
      case CampaignType.call:
        return const Color(0xFFEF4444); // Red
      case CampaignType.whatsApp:
        return const Color(0xFF8B5CF6); // Purple
      case CampaignType.email:
        return const Color(0xFF3B82F6); // Blue
    }
  }

  @override
  List<Object?> get props => [id, title, type, creator, doneCount, totalCount];
}
