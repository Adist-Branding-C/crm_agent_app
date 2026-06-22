import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';

/// Renders a row of 6 stylized OTP digits overlaying a hidden text field.
class OtpInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const OtpInputWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 0,
            height: 0,
            child: TextFormField(
              controller: widget.controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              maxLength: 6,
              onChanged: (val) {
                setState(() {});
                widget.onChanged(val);
              },
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              showCursor: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              final text = widget.controller.text;
              final isFocused = _focusNode.hasFocus && text.length == index;
              final char = text.length > index ? text[index] : '';

              return Container(
                width: 48,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isFocused
                        ? context.primary
                        : (char.isNotEmpty ? context.primary : context.border),
                    width: isFocused ? 2.0 : 1.0,
                  ),
                ),
                child: isFocused
                    ? Container(width: 2, height: 24, color: context.primary)
                    : Text(
                        char,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.textDark,
                        ),
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
