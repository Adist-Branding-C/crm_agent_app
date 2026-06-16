import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../theme.dart';
import 'fab_menu_item.dart';

/// Floating Action Button menu that expands vertically to show sub-actions.
class FabMenu extends StatefulWidget {
  /// Creates a constant [FabMenu].
  const FabMenu({super.key});

  @override State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> {
  bool _isOpen = false;

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _onItemTap(VoidCallback callback) {
    setState(() => _isOpen = false);
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24, right: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isOpen) ...[
            FabMenuItem(
              text: 'Add Deal',
              icon: Icons.business_center,
              color: AppColors.accent,
              onTap: () => _onItemTap(() => _showSnackBar('Add Deal clicked')),
            ),
            const SizedBox(height: 12),
            FabMenuItem(
              text: 'Add Task',
              icon: Icons.calendar_month,
              color: AppColors.warning,
              onTap: () => _onItemTap(() => _showSnackBar('Add Task clicked')),
            ),
            const SizedBox(height: 12),
            FabMenuItem(
              text: 'Delete',
              icon: Icons.delete,
              color: AppColors.errorColor,
              onTap: () => _onItemTap(() => context
                  .read<EnquiryDetailsBloc>()
                  .add(const DeleteEnquiry())),
            ),
            const SizedBox(height: 16),
          ],
          FloatingActionButton(
            onPressed: () => setState(() => _isOpen = !_isOpen),
            backgroundColor: AppColors.primaryColor,
            shape: const CircleBorder(),
            child: Icon(_isOpen ? Icons.close : Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
