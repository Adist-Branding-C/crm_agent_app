import 'package:flutter/material.dart';
import '../theme.dart';

class CallButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double borderRadius;

  const CallButton({super.key, this.onTap, this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Semantics(
        button: true,
        label: 'Call lead',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.call_rounded, color: Colors.white, size: 14),
                  SizedBox(width: 6),
                  Text(
                    'Call',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
