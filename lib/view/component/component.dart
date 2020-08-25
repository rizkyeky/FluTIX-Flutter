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

class ContentList extends StatelessWidget {
  
  final String title;
  final Widget child;
  final double height;
  final int itemCount;
  final List<Movie> movies;

  const ContentList({
    Key key,
    this.title,
    this.child,
    this.height,
    this.itemCount,
    this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 18),
      height: 240,
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
              height: height ?? 162,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount ?? 4,
                itemBuilder: (context, index) => XCard(
                  color: mainColor,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: child ?? Container(
                    width: 120,
                  )
                ),
              ),
            )
          ],
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
