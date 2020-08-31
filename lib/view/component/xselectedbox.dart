part of 'component.dart';

class XSelectedBox extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final EdgeInsets margin;
  final void Function(bool, ) onSelected;
  final bool isSelected;  
  final Color selectedColorBorder;
  final Color defaultColorBorder;
  final Color disableColorBorder;
  final bool isDisable;

  const XSelectedBox({
    Key key, 
    this.text, 
    this.height, 
    this.width, 
    this.margin,
    this.onSelected,
    this.isSelected,
    this.selectedColorBorder,
    this.defaultColorBorder,
    this.disableColorBorder,
    this.isDisable = false
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

    isSelected = widget.isSelected ?? isSelected;

    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          width: 3, 
          color: !widget.isDisable ? (
            isSelected 
              ? (widget.selectedColorBorder ?? mainColor) 
              : (widget.defaultColorBorder ?? accentColor)
            )
          : widget.disableColorBorder ?? borderColor
        ) 
      ),
      child: InkWell(
        onTap: () {
          if (!widget.isDisable) {
            setState(() {
              isSelected = !isSelected;
              widget.onSelected(isSelected);
            });
          }
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
