import 'package:flutter/material.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.subtitle,
    required this.color,
  });

  final VoidCallback onTap;
  final Widget subtitle;

  final Color color;
  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: widget.color),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: widget.subtitle),
        ),
      ),
    );
  }
}
