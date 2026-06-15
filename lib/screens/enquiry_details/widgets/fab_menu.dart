import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../theme.dart';

/// Floating Action Button menu that expands vertically to show sub-actions.
class FabMenu extends StatefulWidget {
  /// Creates a constant [FabMenu].
  const FabMenu({super.key});

  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      right: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isOpen) ...[
            _buildMenuItem('Add Deal', Icons.business_center, const Color(0xFF8B5CF6), () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Deal clicked')));
            }),
            const SizedBox(height: 12),
            _buildMenuItem('Add Task', Icons.calendar_month, const Color(0xFFF59E0B), () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Task clicked')));
            }),
            const SizedBox(height: 12),
            _buildMenuItem('Delete', Icons.delete, AppColors.errorColor, () {
              context.read<EnquiryDetailsBloc>().add(const DeleteEnquiry());
            }),
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

  Widget _buildMenuItem(String label, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        setState(() => _isOpen = false);
        onTap();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
            ),
            child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          ),
          const SizedBox(width: 12),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
            ]),
            child: Icon(icon, color: color, size: 20),
          ),
        ],
      ),
    );
  }
}
