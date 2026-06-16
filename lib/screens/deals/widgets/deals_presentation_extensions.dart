import 'package:flutter/material.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../theme.dart';

/// Extension providing presentation configuration (colors) for [DealStage].
extension DealStagePresentation on DealStage {
  /// Resolves the theme color for this deal stage.
  Color get color {
    return switch (this) {
      DealStage.newStage => AppColors.info,
      DealStage.qualified => AppColors.accent,
      DealStage.proposal => AppColors.warning,
      DealStage.negotiation => AppColors.warningText,
      DealStage.won => AppColors.success,
    };
  }
}
