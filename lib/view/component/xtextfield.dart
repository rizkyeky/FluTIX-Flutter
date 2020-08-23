part of 'component.dart';

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