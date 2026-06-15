import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// The stages a Deal can progress through.
enum DealStage {
  newStage('New', Color(0xFF3B82F6), 0.2),
  qualified('Qualified', Color(0xFF8B5CF6), 0.4),
  proposal('Proposal', Color(0xFFF59E0B), 0.6),
  negotiation('Negotiation', Color(0xFFF97316), 0.8),
  won('Won', Color(0xFF10B981), 1.0);

  final String label;
  final Color color;
  final double progress;

  const DealStage(this.label, this.color, this.progress);
}

/// Represents a single Sales Deal in the pipeline.
class Deal extends Equatable {
  final String id;
  final String title;
  final String clientName;
  final double amount;
  final DealStage stage;
  final String closeDate;
  final String ownerInitials;

  const Deal({
    required this.id,
    required this.title,
    required this.clientName,
    required this.amount,
    required this.stage,
    required this.closeDate,
    this.ownerInitials = 'AN',
  });

  /// Formatted amount helper (e.g., ₹45K or ₹1.20L).
  String get formattedAmount {
    if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(2)}L';
    }
    return '₹${(amount / 1000).toStringAsFixed(0)}K';
  }

  @override
  List<Object?> get props => [
    id,
    title,
    clientName,
    amount,
    stage,
    closeDate,
    ownerInitials,
  ];
}
