part of 'section_header.dart';

class _SectionHeaderTitle extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final Color? leadingIconColor;

  const _SectionHeaderTitle({
    required this.title,
    this.leadingIcon,
    this.leadingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leadingIcon != null) ...[
          Icon(
            leadingIcon,
            color: leadingIconColor ?? AppColors.textDark,
            size: 16,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.textDark,
              ),
        ),
      ],
    );
  }
}
