class TypefacePreset {
  final String title;
  final String subtitle;
  final String styleValue;

  const TypefacePreset({
    required this.title,
    required this.subtitle,
    required this.styleValue,
  });
}

const List<TypefacePreset> typefacePresets = [
  TypefacePreset(
    title: 'Google Sans',
    subtitle: 'App default · geometric · AaBbCc 123',
    styleValue: 'Google Sans',
  ),
  TypefacePreset(
    title: 'System',
    subtitle: 'Native San Francisco · AaBbCc 123',
    styleValue: 'System',
  ),
  TypefacePreset(
    title: 'Inter',
    subtitle: 'Global sans-serif default · AaBbCc 123',
    styleValue: 'Inter',
  ),
  TypefacePreset(
    title: 'SF Pro',
    subtitle: 'System iOS typeface · AaBbCc 123',
    styleValue: 'SF Pro',
  ),
  TypefacePreset(
    title: 'Roboto',
    subtitle: 'Clean Android typeface · AaBbCc 123',
    styleValue: 'Roboto',
  ),
  TypefacePreset(
    title: 'DM Sans',
    subtitle: 'Geometric sans-serif · AaBbCc 123',
    styleValue: 'DM Sans',
  ),
  TypefacePreset(
    title: 'Manrope',
    subtitle: 'Clean & structured geometric · AaBbCc 123',
    styleValue: 'Manrope',
  ),
  TypefacePreset(
    title: 'Poppins',
    subtitle: 'Popular modern sans-serif · AaBbCc 123',
    styleValue: 'Poppins',
  ),
  TypefacePreset(
    title: 'Nunito',
    subtitle: 'Soft rounded curves · AaBbCc 123',
    styleValue: 'Nunito',
  ),
  TypefacePreset(
    title: 'Space Grotesk',
    subtitle: 'Brutalist monospace-like feel · AaBbCc 123',
    styleValue: 'Space Grotesk',
  ),
  TypefacePreset(
    title: 'Satoshi',
    subtitle: 'Elegant high-fashion sans · AaBbCc 123',
    styleValue: 'Satoshi',
  ),
  TypefacePreset(
    title: 'Work Sans',
    subtitle: 'Highly legible UI typeface · AaBbCc 123',
    styleValue: 'Work Sans',
  ),
];
