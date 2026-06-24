import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/call_log/call_log_bloc.dart';
import '../bloc/leads/leads_models.dart';
import '../theme.dart';
import '../utils/sms_service.dart';
import '../screens/enquiry_details/widgets/whatsapp_bottom_sheet.dart';
import 'call_actions_sheet_header.dart';
import 'call_action_item.dart';

class CallActionsBottomSheetBody extends StatelessWidget {
  final Lead lead;
  final SmsService smsService;

  const CallActionsBottomSheetBody({
    super.key,
    required this.lead,
    this.smsService = const SmsService(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CallActionsSheetHeader(lead: lead),
          AppSpacing.gapSm,
          CallActionItem(
            icon: Icons.call_rounded, title: 'Call now', subtitle: lead.phone,
            iconColor: AppColors.success, iconBgColor: AppColors.successBackground,
            onTap: () { context.pop(); context.read<CallLogBloc>().add(LaunchDialer(lead: lead)); },
          ),
          CallActionItem(
            icon: Icons.chat_bubble_outline_rounded, title: 'WhatsApp', subtitle: 'Choose template',
            iconColor: AppColors.success, iconBgColor: AppColors.successBackground,
            onTap: () { context.pop(); WhatsAppBottomSheet.show(context, lead: lead); },
          ),
          CallActionItem(
            icon: Icons.sms_outlined, title: 'Send SMS', subtitle: lead.phone,
            iconColor: AppColors.info, iconBgColor: AppColors.infoBackground,
            onTap: () { context.pop(); smsService.launchSms(lead.phone); },
          ),
          CallActionItem(
            icon: Icons.file_copy_outlined, title: 'Copy number', subtitle: lead.phone,
            iconColor: AppColors.slate600, iconBgColor: AppColors.slate100,
            onTap: () => _handleCopy(context),
          ),
          AppSpacing.gapXxl,
        ],
      ),
    );
  }

  Future<void> _handleCopy(BuildContext context) async {
    context.pop();
    await Clipboard.setData(ClipboardData(text: lead.phone));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number copied to clipboard'), duration: Duration(seconds: 2)),
      );
    }
  }
}
