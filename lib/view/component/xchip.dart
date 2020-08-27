part of 'component.dart';

class XChip extends StatelessWidget {

  final String text;
  final TextStyle textStyle;
  final Color color;

  const XChip({
    Key key,
    this.text,
    this.color,
    this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color ?? borderColor,
          borderRadius: BorderRadius.circular(24)
        ),
        child: Text(text ?? '', style: textStyle ?? blackContentBold,),
      ),
    );
  }
}