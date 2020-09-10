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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Profile',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/no_image.png'),
                        radius: 36,
                      ),
                    ),
                  ),
                  Text('Rizky Eky', style: blueSubtitle),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              
            )
          ],
        )
      ),
    );
  }
}