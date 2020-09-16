part of 'page.dart';

class ProfilePage extends Page<ProfileBloc> {
  ProfilePage({Key key}) : super(key: key);

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
              padding: const EdgeInsets.all(24),
              height: 120,
              color: whiteColor,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                        radius: 36,
                        backgroundImage: (bloc.user.photoURL != '') 
                        ? NetworkImage(bloc.user.photoURL)
                        : const AssetImage('assets/no_image.png') as ImageProvider,
                      )
                  ),
                  const SizedBox(width: 24,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bloc.user.name, style: blueSubtitle),
                      Text(bloc.user.email, style: blackContentRegular),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Material(
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: Text('Edit Profile', style: blackSubtitle,),
                    onTap: () => Navigator.pushNamed(context, '/editprofile'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.confirmation_number),
                    title: Text('My Tickets', style: blackSubtitle,),
                    onTap: () => Navigator.pushNamed(context, '/mytickets'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: Text('My Transaction', style: blackSubtitle,),
                    onTap: () => Navigator.pushNamed(context, '/mytransaction'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: whiteColor,
              height: 120,
            ),
            const SizedBox(height: 12),
            Container(
              color: whiteColor,
              height: 120,
            ),
            const SizedBox(height: 12),
            BlueRectButton(
              text: 'Sign Out',
              onTap: () => bloc.signOut(),
            ),
            const SizedBox(height: 12),
          ],
        )
      ),
    );
  }
}