export 'add_lead_field_events.dart';
export 'add_lead_submit_event.dart';

import 'package:equatable/equatable.dart';

abstract class AddLeadEvent extends Equatable {
  const AddLeadEvent();
  @override
  List<Object?> get props => [];
}
