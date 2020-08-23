part of 'component.dart';

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