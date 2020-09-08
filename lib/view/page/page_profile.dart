part of 'page.dart';

class ProfilePage extends Page<ProfileBloc> {
  ProfilePage({Key key}) : super(key: key);

  final User user = locator.call<User>(instanceName: 'User Active');

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  String convertTime(int minute) {
   
    final str = StringBuffer();

    if (minute > 60) {
      str.write((minute / 60).floor());
      str.write('h ');
    }
    if (minute % 60 != 0) {
      str.write(minute % 60);
      str.write('m');
    }
    return str.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Checkout Movie',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: mainColor), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        )
      ),
    );
  }
}