part of 'page.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 300,
            child: Icon(Icons.check_circle, color: mainColor, size: 36,),
          ),
        
        ],
      ),
    );
  }
}