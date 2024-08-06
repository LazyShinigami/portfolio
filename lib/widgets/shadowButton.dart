import 'package:flutter/material.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton({super.key, required this.child, this.width, this.offset});
  final Widget child;
  final double? width;
  final double? offset;

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool _isViewWorkButtonHovered = true;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isViewWorkButtonHovered = false;
      }),
      onExit: (_) => setState(() {
        _isViewWorkButtonHovered = true;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: (_isViewWorkButtonHovered)
            ? (widget.width != null)
                ? widget.width
                : 200
            : (widget.width != null)
                ? widget.width! + 5
                : 200 + 5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x679E9E9E),
              spreadRadius: 0.0,
              blurStyle: BlurStyle.outer,
              offset: _isViewWorkButtonHovered
                  ? Offset((widget.offset != null) ? widget.offset! : 10,
                      (widget.offset != null) ? widget.offset! : 10)
                  : const Offset(0, 0),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
