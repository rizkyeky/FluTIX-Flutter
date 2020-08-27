import 'package:flutix_training/share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutix_training/model/model.dart';

part 'xtopbar.dart';
part 'xbutton.dart';
part 'xcard.dart';
part 'xtextfield.dart';
part 'xgrid.dart';
part 'xselectedbox.dart';
part 'xtopprogressindicator.dart';
part 'xswitchicon.dart';
part 'xchip.dart';

part 'movie_card.dart';

class BlueRectButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BlueRectButton({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XButton(
      width: 120,
      height: 42,
      color: mainColor,
      isBorder: true,
      onTap: () {},
      child: Text(
        text,
        style: whiteSubtitle,
      ),
    );
  }
}

class ContentList<T> extends StatelessWidget {
  
  final String title;
  final Widget child;
  final double height;
  final List<T> list;
  final ImageProvider<dynamic> Function(T, int) imageBuilder;  
  final Text Function(T, int) textBuilder;  

  const ContentList({
    Key key,
    this.title,
    this.child,
    this.height,
    this.list,
    this.imageBuilder,
    this.textBuilder
  }) : super(key: key);

  Widget buildCard(int index) => XCard(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    backgroundImage: imageBuilder(list[index], index),
    child: Container(
      width: 120,
      height: 150,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.bottomCenter,
    )
  );

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 18),
      height: (height ?? 174) + 78,
      child: Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              onTap: () {},
              title: Text(
                title,
                style: blueTitle,
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: mainColor,
              ),
            ),
            Container(
              height: height ?? 174,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) => (textBuilder != null) ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCard(index),
                    textBuilder(list[index], index) 
                  ],
                )
                : buildCard(index),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class XRenderView extends StatelessWidget {
  final Widget child;
  final Color color;

  const XRenderView({Key key, this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.blue,
      child: child,
    );
  }
}
