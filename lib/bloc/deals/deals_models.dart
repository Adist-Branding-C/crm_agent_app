import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

/// The stages a Deal can progress through.
enum DealStage {
  newStage('New', AppColors.info, 0.2),
  qualified('Qualified', AppColors.accent, 0.4),
  proposal('Proposal', AppColors.warning, 0.6),
  negotiation('Negotiation', AppColors.warningText, 0.8),
  won('Won', AppColors.success, 1.0);

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
