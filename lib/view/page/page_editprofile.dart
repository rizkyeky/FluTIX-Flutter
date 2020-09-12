part of 'page.dart';

class EditProfilePage extends Page<EditProfileBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

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
              height: 240,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        )
      ),
    );
  }
}