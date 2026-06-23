import 'package:flutter/material.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/custom_text_field.dart';
import 'target_progress_indicator.dart';

/// Form section for monthly targets (Target field, reactive progress metrics).
class TargetDetailsSection extends StatelessWidget {
  final TextEditingController targetController;
  final int achievedAmount;

  const TargetDetailsSection({
    super.key,
    required this.targetController,
    required this.achievedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monthly target',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                label: 'Target (₹)',
                hintText: 'Enter monthly target',
                controller: targetController,
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Target is required';
                  }
                  final parsed = int.tryParse(val.trim());
                  if (parsed == null || parsed <= 0) {
                    return 'Enter a valid positive target';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: targetController,
                builder: (context, value, _) {
                  final parsedTarget = int.tryParse(value.text.trim()) ?? 0;
                  return TargetProgressIndicator(
                    achieved: achievedAmount,
                    target: parsedTarget,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
