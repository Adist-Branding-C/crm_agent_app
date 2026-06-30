/// Model representing a single section of the Privacy Policy.
class PrivacyPolicySection {
  /// The title/header of this policy section.
  final String title;

  /// The paragraphs or bulleted content of this section.
  final List<String> bulletPoints;

  /// Creates a [PrivacyPolicySection].
  const PrivacyPolicySection({required this.title, required this.bulletPoints});
}
