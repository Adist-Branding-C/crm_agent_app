import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';
import '../../theme/app_text_theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';
import '../../data/settings_notifier.dart';
import '../../router/app_routes.dart';

/// Screen widget displaying global font configurations (size, style) with live CRM preview.
class FontSettingsScreen extends StatefulWidget {
  const FontSettingsScreen({super.key});

  @override
  State<FontSettingsScreen> createState() => _FontSettingsScreenState();
}

class _FontSettingsScreenState extends State<FontSettingsScreen> {
  bool _isFirstTimeSetup = false;

  @override
  void initState() {
    super.initState();
    final settings = Provider.of<SettingsNotifier>(context, listen: false);
    _isFirstTimeSetup = !settings.hasSavedSettings;
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsNotifier>();

    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Font Settings',
            subtitleWidget: Text(
              'Text size & typeface',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
                fontSize: 12.s,
              ),
            ),
            showBackButton: !_isFirstTimeSetup,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              children: [
                _buildLivePreviewCard(context),
                AppSpacing.gapLg,
                _buildSectionHeader(context, 'Text size'),
                FontSizeSlider(
                  selectedSize: settings.fontSize,
                  onSelected: (size) => settings.setFontSize(size),
                ),
                AppSpacing.gapLg,
                _buildSectionHeader(context, 'Typeface'),
                _buildTypefaceCard(
                  context,
                  title: 'Google Sans',
                  subtitle: 'App default · geometric · AaBbCc 123',
                  styleValue: 'Google Sans',
                  isSelected: settings.fontStyle == 'Google Sans',
                  onTap: () => settings.setFontStyle('Google Sans'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'System',
                  subtitle: 'Native San Francisco · AaBbCc 123',
                  styleValue: 'System',
                  isSelected: settings.fontStyle == 'System' || settings.fontStyle == 'Default',
                  onTap: () => settings.setFontStyle('System'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Inter',
                  subtitle: 'Global sans-serif default · AaBbCc 123',
                  styleValue: 'Inter',
                  isSelected: settings.fontStyle == 'Inter',
                  onTap: () => settings.setFontStyle('Inter'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'SF Pro',
                  subtitle: 'System iOS typeface · AaBbCc 123',
                  styleValue: 'SF Pro',
                  isSelected: settings.fontStyle == 'SF Pro',
                  onTap: () => settings.setFontStyle('SF Pro'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Roboto',
                  subtitle: 'Clean Android typeface · AaBbCc 123',
                  styleValue: 'Roboto',
                  isSelected: settings.fontStyle == 'Roboto',
                  onTap: () => settings.setFontStyle('Roboto'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'DM Sans',
                  subtitle: 'Geometric sans-serif · AaBbCc 123',
                  styleValue: 'DM Sans',
                  isSelected: settings.fontStyle == 'DM Sans',
                  onTap: () => settings.setFontStyle('DM Sans'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Manrope',
                  subtitle: 'Clean & structured geometric · AaBbCc 123',
                  styleValue: 'Manrope',
                  isSelected: settings.fontStyle == 'Manrope',
                  onTap: () => settings.setFontStyle('Manrope'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Poppins',
                  subtitle: 'Popular modern sans-serif · AaBbCc 123',
                  styleValue: 'Poppins',
                  isSelected: settings.fontStyle == 'Poppins',
                  onTap: () => settings.setFontStyle('Poppins'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Nunito',
                  subtitle: 'Soft rounded curves · AaBbCc 123',
                  styleValue: 'Nunito',
                  isSelected: settings.fontStyle == 'Nunito',
                  onTap: () => settings.setFontStyle('Nunito'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Space Grotesk',
                  subtitle: 'Brutalist monospace-like feel · AaBbCc 123',
                  styleValue: 'Space Grotesk',
                  isSelected: settings.fontStyle == 'Space Grotesk',
                  onTap: () => settings.setFontStyle('Space Grotesk'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Satoshi',
                  subtitle: 'Elegant high-fashion sans · AaBbCc 123',
                  styleValue: 'Satoshi',
                  isSelected: settings.fontStyle == 'Satoshi',
                  onTap: () => settings.setFontStyle('Satoshi'),
                ),
                _buildTypefaceCard(
                  context,
                  title: 'Work Sans',
                  subtitle: 'Highly legible UI typeface · AaBbCc 123',
                  styleValue: 'Work Sans',
                  isSelected: settings.fontStyle == 'Work Sans',
                  onTap: () => settings.setFontStyle('Work Sans'),
                ),
                // Disclaimer block
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 4.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 14.s,
                        color: AppColors.textMuted,
                      ),
                      AppSpacing.gapWSm,
                      Expanded(
                        child: Text(
                          'Changes apply instantly across the whole app and are saved on this device.',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11.s,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isFirstTimeSetup) ...[
                  AppSpacing.gapLg,
                  CustomButton(
                    text: 'Proceed to Dashboard',
                    onPressed: settings.hasSavedSettings
                        ? () {
                            context.go(AppRoutes.dashboardPath);
                          }
                        : null,
                  ),
                ],
                AppSpacing.gapXl,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontSize: 16.s,
        ),
      ),
    );
  }

  Widget _buildLivePreviewCard(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(16.0.w),
      color: Colors.white,
      border: Border.all(color: AppColors.borderLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LIVE PREVIEW',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.bold,
              fontSize: 10.s,
              letterSpacing: 0.5.w,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            'Good morning, Arjun',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 19.s,
            ),
          ),
          AppSpacing.gapXxs,
          Text(
            'You have 6 follow-ups today',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
              fontSize: 13.s,
            ),
          ),
          AppSpacing.gapMd,
          // Inside Card Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEBEE),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'PM',
                    style: TextStyle(
                      color: const Color(0xFFE53935),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.s,
                    ),
                  ),
                ),
                AppSpacing.gapWMd,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Priya Menon',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.s,
                        ),
                      ),
                      AppSpacing.gapXxs,
                      Text(
                        'Premium Course · Calicut',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 11.s,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bolt_rounded,
                        size: 12.s,
                        color: const Color(0xFFE53935),
                      ),
                      AppSpacing.gapXxs,
                      Text(
                        'Hot',
                        style: TextStyle(
                          color: const Color(0xFFE53935),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.s,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.gapMd,
          Text(
            'This is how text appears across your dashboard, leads and reports. Pick the size and typeface that read best for you.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textDark,
              fontSize: 13.s,
              height: 1.45,
            ),
          ),
          AppSpacing.gapMd,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 14.0.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.phone_outlined, size: 16.s),
              label: Text(
                'Call lead',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.s,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypefaceCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String styleValue,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final customTheme = getCustomTextTheme(Theme.of(context).textTheme, styleValue);
    final titleStyle = customTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
      fontSize: 16.s,
    );

    return Semantics(
      button: true,
      selected: isSelected,
      label: '$title Typeface Option',
      child: Container(
        margin: EdgeInsets.only(bottom: 12.0.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFEBEE).withValues(alpha: 0.2) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFE53935) : AppColors.borderLight,
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: titleStyle),
                      AppSpacing.gapXxs,
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 12.s,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? const Color(0xFFE53935) : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? const Color(0xFFE53935) : AppColors.borderLight,
                      width: 1.5.w,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          size: 14.s,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom slider for choosing font size using a stop-scale track.
class FontSizeSlider extends StatelessWidget {
  final String selectedSize;
  final ValueChanged<String> onSelected;

  const FontSizeSlider({
    super.key,
    required this.selectedSize,
    required this.onSelected,
  });

  static const List<String> sizes = [
    'Tiny',
    'Extra Small',
    'Small',
    'Default',
    'Large',
    'Extra Large',
    'Huge',
  ];

  static const List<String> percentages = [
    '70%',
    '80%',
    '90%',
    '100%',
    '115%',
    '130%',
    '150%',
  ];

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = sizes.indexOf(selectedSize);
    final int safeIndex = selectedIndex == -1 ? 3 : selectedIndex;

    return CustomCard(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
      color: Colors.white,
      border: Border.all(color: AppColors.borderLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'A',
                style: TextStyle(
                  fontSize: 12.s,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double width = constraints.maxWidth;
                      final double stepWidth = width / (sizes.length - 1);
                      return GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          final RenderBox box = context.findRenderObject() as RenderBox;
                          final localPos = box.globalToLocal(details.globalPosition);
                          // Slider content starts after 'A' text padding
                          final double relativeX = localPos.dx - 16.w - 12.w;
                          final double clampedX = relativeX.clamp(0.0, width);
                          final int index = (clampedX / stepWidth).round().clamp(0, sizes.length - 1);
                          onSelected(sizes[index]);
                        },
                        onTapDown: (details) {
                          final double clickedX = details.localPosition.dx;
                          final int index = (clickedX / stepWidth).round().clamp(0, sizes.length - 1);
                          onSelected(sizes[index]);
                        },
                        child: SizedBox(
                          height: 32.h,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              // Background track
                              Container(
                                height: 3.h,
                                decoration: BoxDecoration(
                                  color: AppColors.borderLight,
                                  borderRadius: BorderRadius.circular(1.5.r),
                                ),
                              ),
                              // Active track
                              FractionallySizedBox(
                                widthFactor: safeIndex / (sizes.length - 1),
                                child: Container(
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE53935),
                                    borderRadius: BorderRadius.circular(1.5.r),
                                  ),
                                ),
                              ),
                              // Stops
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(sizes.length, (index) {
                                  final isSelected = index == safeIndex;
                                  final isPassed = index <= safeIndex;

                                  if (isSelected) {
                                    return Container(
                                      width: 16.w,
                                      height: 16.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE53935),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFE53935).withValues(alpha: 0.3),
                                            blurRadius: 6.r,
                                            spreadRadius: 2.w,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: BoxDecoration(
                                        color: isPassed ? const Color(0xFFE53935) : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isPassed ? const Color(0xFFE53935) : AppColors.borderLight,
                                          width: 1.5.w,
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                'A',
                style: TextStyle(
                  fontSize: 20.s,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          AppSpacing.gapMd,
          const Divider(height: 1, color: AppColors.borderLight),
          AppSpacing.gapMd,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedSize == 'Default' ? 'Default' : selectedSize,
                style: TextStyle(
                  fontSize: 15.s,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                percentages[safeIndex],
                style: TextStyle(
                  fontSize: 14.s,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
