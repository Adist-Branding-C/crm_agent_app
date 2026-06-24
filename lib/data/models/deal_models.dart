import 'package:equatable/equatable.dart';

enum DealStage {
  newStage('New', 0.2),
  qualified('Qualified', 0.4),
  proposal('Proposal', 0.6),
  negotiation('Negotiation', 0.8),
  won('Won', 1.0);

  final String label;
  final double progress;
  const DealStage(this.label, this.progress);
}

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
