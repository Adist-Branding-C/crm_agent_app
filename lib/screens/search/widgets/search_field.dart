import 'dart:async';
import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

/// A debounced search text input field widget.
class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? _debounce;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
    _showClear = widget.controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _debounce?.cancel();
    super.dispose();
  }

  void _onTextChanged() {
    final text = widget.controller.text;
    if (_showClear != text.isNotEmpty) {
      setState(() => _showClear = text.isNotEmpty);
    }
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) widget.onChanged(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.sm,
      ),
      child: CustomCard(
        borderRadius: 8.r,
        child: TextField(
          controller: widget.controller,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textDark),
          decoration: InputDecoration(
            hintText: 'Search enquiries, phone, location...',
          
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted,),
            prefixIcon:  Icon(
              Icons.search_rounded,
              color: AppColors.textMuted,
              size: 19.s,
            ),
            suffixIcon: _showClear
                ? IconButton(
                    icon: Icon(Icons.close_rounded, size: 18.s),
                    color: AppColors.textMuted,
                    onPressed: () {
                      widget.controller.clear();
                      widget.onChanged('');
                    },
                  )
                : null,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          
            
          ),
        ),
      ),
    );
  }
}
