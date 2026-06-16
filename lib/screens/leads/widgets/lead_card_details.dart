part of 'lead_card.dart';

class _LeadCardDetails extends StatelessWidget {
  final Lead lead;

  const _LeadCardDetails({required this.lead});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lead.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          '${lead.source.label} · ${lead.status.label}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: AppColors.textMuted,
              ),
        ),
      ],
    );
  }
}
