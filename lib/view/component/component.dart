import 'package:flutix_training/share/share.dart';
import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final bool isBorder;
  final double margin;

  const XButton({
    Key key,
    @required this.child,
    @required this.onTap,
    this.color,
    this.margin = 4,
    this.width = double.infinity,
    this.height = 54,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
        clipBehavior: Clip.antiAlias,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: isBorder ? const BorderSide(color: accentColor) : BorderSide.none
        ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minWidth: 30,
            minHeight: 30,
            maxWidth: width,
            maxHeight: height
          ),
          child: child,
        ),
      ),
    );
  }
}