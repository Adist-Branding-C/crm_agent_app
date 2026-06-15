import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represents a single Campaign metric and status.
class Campaign extends Equatable {
  final String id;
  final String title;
  final String type; // 'Call', 'WhatsApp', 'Email'
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
      case 'Call':
        return const Color(0xFFEF4444); // Red
      case 'WhatsApp':
        return const Color(0xFF8B5CF6); // Purple
      case 'Email':
        return const Color(0xFF3B82F6); // Blue
      default:
        return const Color(0xFFE53935);
    }
  }

  @override
  List<Object?> get props => [id, title, type, creator, doneCount, totalCount];
}
