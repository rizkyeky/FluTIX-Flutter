part of 'component.dart';

class XSwitchIcon extends StatefulWidget {
  
  final IconData activeIcon;
  final IconData nonactiveIcon;
  final Color activeColor;
  final Color nonactiveColor;
  final void Function() onSelected;

  const XSwitchIcon({
    Key key, 
    @required this.activeIcon, 
    @required this.nonactiveIcon, 
    @required this.onSelected, 
    this.activeColor,
    this.nonactiveColor,
  })
    : super(key: key);

  @override
  _XSwitchIconState createState() => _XSwitchIconState();
}

class _XSwitchIconState extends State<XSwitchIcon> {
  
  bool isSelected;

  @override
  void initState() {
    isSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onSelected();
        setState(() => isSelected = !isSelected);
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        child : isSelected
          ? Icon(widget.activeIcon, key: const Key("active"), color: widget.activeColor ?? Colors.white,)
          : Icon(widget.nonactiveIcon, key: const Key("nonactive"), color: widget.nonactiveColor ?? Colors.white),
      )
    );
  }
}
