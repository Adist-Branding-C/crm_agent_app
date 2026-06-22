import 'leads_enums.dart';
import 'leads_models.dart';

extension LeadCopyWithCallLog on Lead {
  Lead copyWithCallLog({
    required LeadStatus newStatus,
    required LeadPurpose newPurpose,
    String? remark,
  }) => Lead(
    id: id, name: name, status: newStatus,
    source: newPurpose, category: category,
    phone: phone, location: location,
    email: email, leadSource: leadSource,
    nextFollowUp: nextFollowUp,
    note: (remark != null && remark.isNotEmpty) ? remark : note,
  );
}

extension LeadCopyWithStatus on Lead {
  Lead copyWithStatus(LeadStatus newStatus) => Lead(
    id: id, name: name, status: newStatus,
    source: source, category: category,
    phone: phone, location: location,
    email: email, leadSource: leadSource,
    nextFollowUp: nextFollowUp, note: note,
  );
}
