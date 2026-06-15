import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../attendance/widgets/timeline_tile_config.dart';

/// Mapping of enquiry activity types to their timeline tile configurations.
const activitiesConfigs = {
  EnquiryActivityType.call: TimelineTileConfig(
    icon: Icons.phone,
    iconColor: Color(0xFF10B981),
    bgColor: Color(0xFFECFDF5),
  ),
  EnquiryActivityType.statusChange: TimelineTileConfig(
    icon: Icons.sync,
    iconColor: Color(0xFF8B5CF6),
    bgColor: Color(0xFFF5F3FF),
  ),
  EnquiryActivityType.note: TimelineTileConfig(
    icon: Icons.description,
    iconColor: Color(0xFF3B82F6),
    bgColor: Color(0xFFEFF6FF),
  ),
  EnquiryActivityType.task: TimelineTileConfig(
    icon: Icons.check_box,
    iconColor: Color(0xFFF59E0B),
    bgColor: Color(0xFFFFFBEB),
  ),
  EnquiryActivityType.system: TimelineTileConfig(
    icon: Icons.person,
    iconColor: Color(0xFFEF4444),
    bgColor: Color(0xFFFEF2F2),
  ),
};
