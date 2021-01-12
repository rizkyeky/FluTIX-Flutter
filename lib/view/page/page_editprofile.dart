part of 'page.dart';

class EditProfilePage extends Page<EditProfileBloc> {

  @override
  void dispose() {}

  @override
  void init() {
    _nameText.text = bloc.user.name;
    _emailText.text = bloc.user.email;
  }

  final TextEditingController _nameText = TextEditingController();
  final TextEditingController _emailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Profile',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: mainColor,), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: Builder(
        builder: (contextScaffold) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                height: 210,
                width: MediaQuery.of(context).size.width,
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        bloc.setProfilePicture();
                      },
                      child: CircleAvatar(
                        radius: 54,
                        backgroundImage: (bloc.user.photoURL != '') 
                        ? NetworkImage(bloc.user.photoURL)
                        : const AssetImage('assets/no_image.png') as ImageProvider,
                      )
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(bloc.user.name, style: blueSubtitle),
                        Text(bloc.user.email, style: blackContentRegular),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              Container(
                height: 240,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    XTextField(
                      controller: _nameText,
                      text: 'Name',
                    ),
                    XTextField(
                      controller: _emailText,
                      text: 'Email',
                    ),
                    FlatButton.icon(
                      label: Text('Save Changes', style: blueSubtitle,),
                      icon: const Icon(Icons.check, color: mainColor),
                      onPressed: () {
                        if (_nameText.text != bloc.user.name || _emailText.text != bloc.user.email) {
                          // bloc.updateUser(_nameText.text, _emailText.text);
                          Scaffold.of(contextScaffold).showSnackBar(snackBar(
                            contentText: 'Saved',
                            labelText: 'DISMISS',
                            onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                          ));
                        } else {
                          Scaffold.of(contextScaffold).showSnackBar(snackBar(
                            contentText: 'No Changed',
                            labelText: 'DISMISS',
                            onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                          ));
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              FlatButton(
                onPressed: () async {
                  // await bloc.resetPassword().whenComplete(() {
                  //   Scaffold.of(contextScaffold).showSnackBar(snackBar(
                  //     contentText: 'The link to change your password has been sent to your email',
                  //     labelText: 'DISMISS',
                  //     onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                  //   ));
                  // });
                },
                child: Text('Reset Password', style: blackContentRegular,)
              )
            ],
          )
        ),
      ),
    );
  }
}