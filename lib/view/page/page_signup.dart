part of 'page.dart';

class SignUpPage extends Page<SignUpBloc> {
  SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopLinearProgressIndicator(
        backgroundColor: mainColor,
        valueColor:accentColor,
        stream: bloc.loadingStream,
      ),
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Let's start your\nexperience now",
              style: blueTitle,
            ),
            const SizedBox(height: 36,),
            const XTextField(
              text: 'Name',
            ),
            const SizedBox(height: 36,),
            const XTextField(
              text: 'Email',
            ),
            const SizedBox(height: 36,),
            const XTextField(
              text: 'Password',
            ),
            const SizedBox(height: 36,),
            BlueRectButton(
              text: "Let's start",
              onTap: () {
                // bloc.setLoading()
              },
            ),
            const SizedBox(height: 36,),
            Row(
              children: [
                Text('Already have account ? ',
                  style: blackSubtitle,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/signin'),
                  child: Text('Join now',
                    style: blueSubtitle,
                  ),
                ),
              ],
            )
          ],
        ),
      ) 
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}