part of 'component.dart';

class XTopBar extends AppBar {
  
  XTopBar({
    Key key,
    String textTitle,
    Widget leading,
    Color backgroundColor,
    TextStyle textStyle,
    bool automaticallyImplyLeading = true
  }) : super(
    automaticallyImplyLeading: automaticallyImplyLeading,
    key: key,
    backgroundColor: backgroundColor ?? mainColor,
    centerTitle: true,
    elevation: 0,
    title: Text(textTitle, style: textStyle ?? whiteTitle,),
    leading: leading
  );
}