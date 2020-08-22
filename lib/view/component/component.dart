import 'package:flutix_training/share/share.dart';
import 'package:flutter/material.dart';

class BlueRectButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;

  const BlueRectButton({
  Key key,
  this.text,
  this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XButton(
      width: 120,
      height: 42,
      color: mainColor,
      isBorder: true,
      onTap: () {},
      child: Text(text,
        style: whiteSubtitle,
      ),
    );
  }
}

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

class XTextField extends StatelessWidget {

  final String text;
  final TextEditingController controller;

  const XTextField({ 
  Key key,
  this.text,
  this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: blackSubtitle,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: accentColor,
            width: 3
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: mainColor,
            width: 3
          )
        ),
      ),
    );
  }
}

class XGrid<T> extends StatelessWidget {

  final Widget Function(BuildContext, int, List<T>) builder;
  final int columnCount;
  final EdgeInsets padding;
  final List<T> list;

  const XGrid({
    Key key,
    this.builder,
    this.padding = const EdgeInsets.all(6),
    @required this.list,
    @required this.columnCount
  }) : super(key: key);

  List<Widget> _buildChildren(BuildContext context) {
    final children = <Widget>[];
    int index = -1;
    
    for (int i = 0; i < list.length/columnCount; i++) {
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for (int j = 0; j < columnCount; j++) Builder(
              builder: (context) {
                index++;
                return Container(
                  // color: Colors.amber,
                  padding: padding,
                  width: (MediaQuery.of(context).size.width/2) - 60,
                  child: builder(context, index, list)
                );
              },
            ),
          ]
        )
      );
    } 

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildChildren(context)
    );
  }
}

class XSelectedBox extends StatefulWidget {
  XSelectedBox({Key key}) : super(key: key);

  @override
  _XSelectedBoxState createState() => _XSelectedBoxState();
}

class _XSelectedBoxState extends State<XSelectedBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: accentColor,
          width: 3
        )
      ),
      child: Text('Text'),
    );
  }
}

class TopLinearProgressIndicator extends StatelessWidget
    implements PreferredSizeWidget {

  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final bool isShow;
  final Stream<bool> stream;
  
  @override
  Size get preferredSize => const Size.fromHeight(6);
  
  TopLinearProgressIndicator({
    Key key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.stream,
    this.isShow = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24,),
        StreamBuilder<bool>(
          initialData: true,
          stream: stream,
          builder: (context, snapshot) => (snapshot.data) ? LinearProgressIndicator(
            value: value,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          )
          : const SizedBox(height: 6,)
        ),
      ],
    );
  }
}