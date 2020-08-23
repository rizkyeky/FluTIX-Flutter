part of 'component.dart';


class XSelectedBox extends StatefulWidget {

  final String text;

  const XSelectedBox({
    Key key,
    this.text,

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
    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(width: 3, color: isSelected ? mainColor : accentColor)
      ),
      child: InkWell(
        onTap: () => setState(() {
          isSelected = !isSelected; 
        }),
        child: Container(
          alignment: Alignment.center,
          height: 48,
          child: Text(widget.text, style: blueSubtitle,),
        ),
      ),
    );
  }
}
