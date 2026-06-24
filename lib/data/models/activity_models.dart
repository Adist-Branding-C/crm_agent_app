import 'package:equatable/equatable.dart';
import 'lead_enums.dart';

enum EnquiryActivityType { call, statusChange, note, task, system }

class EnquiryActivity extends Equatable {
  final String id;
  final String title;
  final String time;
  final EnquiryActivityType type;
  final String? callStatus;
  final String? duration;
  final LeadStatus? leadStatus;
  final LeadPurpose? purpose;
  final String? remark;
  final String? date;
  final String? timeOfDay;

  const EnquiryActivity({
    required this.id,
    required this.title,
    required this.time,
    required this.type,
    this.callStatus,
    this.duration,
    this.leadStatus,
    this.purpose,
    this.remark,
    this.date,
    this.timeOfDay,
  });

  factory EnquiryActivity.callLog({
    required String id,
    required String callStatus,
    required String purposeLabel,
    required LeadStatus leadStatus,
    required LeadPurpose purpose,
    required String remark,
    String? duration,
    String? date,
    String? timeOfDay,
  }) {
    return EnquiryActivity(
      id: id,
      title: '@You logged a call ($callStatus) - Purpose: $purposeLabel',
      time: 'Just now',
      type: EnquiryActivityType.call,
      callStatus: callStatus,
      duration: duration ?? '4:12 mins',
      leadStatus: leadStatus,
      purpose: purpose,
      remark: remark,
      date: date ?? 'Today, 22 June 2026',
      timeOfDay: timeOfDay ?? '9:30 AM',
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        time,
        type,
        callStatus,
        duration,
        leadStatus,
        purpose,
        remark,
        date,
        timeOfDay,
      ];
}
