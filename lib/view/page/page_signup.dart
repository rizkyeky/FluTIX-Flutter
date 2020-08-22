part of 'page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key key}) : super(key: key);

  final SignInBloc bloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopLinearProgressIndicator(
        backgroundColor: mainColor,
        valueColor:accentColor,
        stream: bloc.isLoadingStream,
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
                  onTap: () => print('tap'),
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
}