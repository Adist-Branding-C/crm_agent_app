import 'package:flutter/material.dart';
import 'checked_in_card_body.dart';
import 'checked_out_card_body.dart';

/// Renders the card container for check-in action based on current state.
class CheckInCard extends StatelessWidget {
  /// Whether the user is checked in.
  final bool isCheckedIn;

  /// The check-in time if checked in.
  final String? checkInTime;

  /// The location name.
  final String location;

  /// Creates a constant [CheckInCard].
  const CheckInCard({
    super.key,
    required this.isCheckedIn,
    required this.location,
    this.checkInTime,
  });

  @override
  Widget build(BuildContext context) {
    if (isCheckedIn) {
      return CheckedInCardBody(checkInTime: checkInTime, location: location);
    } else {
      return const CheckedOutCardBody();
    }
  }
}
