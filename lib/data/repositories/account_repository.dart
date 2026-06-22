import '../../bloc/account/account_models.dart';

/// Repository interface managing the agent account profile data.
abstract class AccountRepository {
  /// Fetches the profile and stats for the logged-in agent.
  Future<AccountProfile> getProfile();

  /// Updates the profile details for the logged-in agent.
  Future<AccountProfile> updateProfile(AccountProfile profile);
}

