import 'package:flutix_training/share/share.dart';
import 'package:flutter/material.dart';

part 'xtopbar.dart';
part 'xbutton.dart';
part 'xcard.dart';
part 'xtextfield.dart';
part 'xgrid.dart';
part 'xselectedbox.dart';
part 'xtopprogressindicator.dart';

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

