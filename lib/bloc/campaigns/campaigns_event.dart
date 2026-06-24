import 'package:equatable/equatable.dart';

/// Base class for all Campaigns BLoC events.
abstract class CampaignsEvent extends Equatable {
  const CampaignsEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load/fetch campaigns list.
class LoadCampaigns extends CampaignsEvent {
  const LoadCampaigns();
}
