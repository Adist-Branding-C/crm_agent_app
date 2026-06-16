import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

class RecentSection extends StatelessWidget {
  final List<String> queries;
  final ValueChanged<String> onTap;

  const RecentSection({
    super.key,
    required this.queries,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (queries.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RECENT',
            style: TextStyle(
              color: AppColors.textMuted,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 12),
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
                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontSize: 14,
                          ),
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
