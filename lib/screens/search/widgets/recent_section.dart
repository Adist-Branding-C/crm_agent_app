import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

class RecentSection extends StatelessWidget {
  final List<String> queries;
  final ValueChanged<String> onTap;

  const RecentSection({super.key, required this.queries, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (queries.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RECENT',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          AppSpacing.gapMd,
          CustomCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: List.generate(queries.length, (index) {
                final q = queries[index];
                return Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: const Icon(
                          Icons.history_rounded,
                          color: AppColors.textMuted,
                          size: 20,
                        ),
                        title: Text(
                          q,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textDark),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textMuted,
                          size: 20,
                        ),
                        onTap: () => onTap(q),
                      ),
                    ),
                    if (index < queries.length - 1)
                      const Divider(height: 1, color: AppColors.borderLight),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
