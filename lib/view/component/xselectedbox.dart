part of 'component.dart';

class XSelectedBox extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final EdgeInsets margin;
  final void Function(bool, ) onSelected;
  final Color colorBorder;
  final bool isSelected;  

  const XSelectedBox({
    Key key, 
    this.text, 
    this.height, 
    this.width, 
    this.margin,
    this.onSelected,
    this.colorBorder,
    this.isSelected,
  }) : super(key: key);

  @override
  _XSelectedBoxState createState() => _XSelectedBoxState();
}

class _XSelectedBoxState extends State<XSelectedBox> {
  bool isSelected;

  @override
  void initState() {
    isSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    isSelected = widget.isSelected;

    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          width: 3, color: isSelected ? mainColor : accentColor
        )
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            widget.onSelected(isSelected);
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: widget.height ?? 48,
          width: widget.width ?? 96,
          child: Text(
            widget.text,
            style: blueSubtitle,
          ),
        ),
      ),
    );
  }
}
