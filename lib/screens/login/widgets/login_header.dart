import 'package:flutter/material.dart';
import '../../../theme.dart';

/// The header widget displaying the brand logo and title.
class LoginHeader extends StatelessWidget {
  /// Creates a constant [LoginHeader] widget.
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Semantics(
            label: 'CRM Agent Logo',
          
            image: true,
            child: Container(
              width: 75.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Icon(
                Icons.people_rounded,
                color: Colors.white,
                size: 32.s,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.xl),
          RichText(
            
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
              children: [
                 TextSpan(
                  text: 'CRM ',
                  
                  style: TextStyle(color: AppTheme.textDark,fontSize: 27.s,fontWeight: FontWeight.w900),
                ),
                TextSpan(
                  text: 'Agent',
                  style: TextStyle(color: AppTheme.primaryColor,fontSize: 27.s,fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Sign in to your agent account',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,fontSize: 15.s),
          ),
        ],
      ),
    );
  }
}
