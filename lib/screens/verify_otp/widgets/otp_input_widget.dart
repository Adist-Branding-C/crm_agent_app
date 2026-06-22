import 'package:flutter/material.dart';
import 'digit_box.dart';

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
              return DigitBox(char: char, isFocused: isFocused);
            }),
          ),
        ],
      ),
    );
  }
}
