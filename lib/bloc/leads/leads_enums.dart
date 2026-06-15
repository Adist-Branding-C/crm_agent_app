/// Rating category of a lead.
enum LeadCategory {
  hot('Hot'),
  warm('Warm'),
  cold('Cold');

  final String label;
  const LeadCategory(this.label);
}

/// Status stages of a lead.
enum LeadStatus {
  newStatus('New'),
  interested('Interested'),
  qualified('Qualified'),
  followUp('Follow Up'),
  notInterested('Not Interested'),
  converted('Converted'),
  lost('Lost');

  final String label;
  const LeadStatus(this.label);
}

/// Marketing/Acquisition channel source.
enum LeadSource {
  facebook('Facebook'),
  website('Website'),
  referral('Referral'),
  instagram('Instagram'),
  walkIn('Walk-in'),
  googleAds('Google Ads');

  final String label;
  const LeadSource(this.label);
}

/// Intended purpose or acquisition event of a lead.
enum LeadPurpose {
  enquiry('Enquiry'),
  newAdmission('New Admission'),
  demoRequest('Demo Request');

  final String label;
  const LeadPurpose(this.label);
}

/// Sorting options for leads.
enum SortLeadsBy {
  newest('Newest'),
  oldest('Oldest'),
  alphabetical('A-Z'),
  followUp('Follow-up');

  final String label;
  const SortLeadsBy(this.label);
}
