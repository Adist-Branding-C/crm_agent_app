part of 'campaigns_bloc.dart';

/// Base class for all states of the Campaigns BLoC.
abstract class CampaignsState extends Equatable {
  const CampaignsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the campaigns screen.
class CampaignsInitial extends CampaignsState {
  const CampaignsInitial();
}

/// State emitted while campaigns are loading.
class CampaignsLoading extends CampaignsState {
  const CampaignsLoading();
}

/// State emitted when campaigns are loaded successfully.
class CampaignsLoaded extends CampaignsState {
  final List<Campaign> campaigns;

  const CampaignsLoaded({required this.campaigns});

  @override
  List<Object?> get props => [campaigns];
}

/// State emitted when campaigns loading fails.
class CampaignsError extends CampaignsState {
  final String errorMessage;

  const CampaignsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
