import 'dart:async';
import 'package:flutter/material.dart';
import '../../../theme.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppTheme.cardShadow,
        ),
        child: TextField(
          controller: widget.controller,
          style: const TextStyle(color: AppColors.textDark, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search enquiries, phone, location...',
            hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
            prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
            suffixIcon: _showClear
                ? IconButton(
                    icon: const Icon(Icons.close_rounded, size: 18),
                    color: AppColors.textMuted,
                    onPressed: () {
                      widget.controller.clear();
                      widget.onChanged('');
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }
}
