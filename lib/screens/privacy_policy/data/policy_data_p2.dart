import 'privacy_policy_model.dart';

/// Part 2 of the structured Privacy Policy sections.
final List<PrivacyPolicySection> privacySectionsPart2 = [
  const PrivacyPolicySection(
    title: '4. How We Use Information',
    bulletPoints: [
      'To provide, maintain, and optimize our CRM services.',
      'To verify agent attendance and calculate performance analytics.',
      'To notify you of upcoming follow-ups, deals, and sales campaigns.',
      'To comply with legal obligations and resolve disputes.',
    ],
  ),
  const PrivacyPolicySection(
    title: '5. Data Security and Sharing',
    bulletPoints: [
      'Data Sharing: We do not sell or lease your personal data. We only share '
          'information with service providers under confidentiality agreements '
          'to perform hosting or support services.',
      'Data Security: We employ industry-standard encryption (SSL/TLS) for data '
          'in transit and implement robust physical and virtual access controls '
          'at rest.',
    ],
  ),
  const PrivacyPolicySection(
    title: '6. Your Rights and Account Deletion',
    bulletPoints: [
      'Access and Correction: You have the right to request access to and '
          'rectification of your personal information in our database.',
      'Account Deletion: Under App Store Guidelines, you can request full '
          'deletion of your account and associated records by initiating a '
          'request in settings or contacting support@yourcrm.com. We will delete '
          'your records within 30 days of validation.',
    ],
  ),
  const PrivacyPolicySection(
    title: '7. Contact Us',
    bulletPoints: [
      'If you have questions about this policy or your data rights, contact '
          'our support desk at support@yourcrm.com.',
      'CRM Agent Application Team - Adist Branding Company.',
    ],
  ),
];
