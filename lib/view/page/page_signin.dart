part of 'page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key key}) : super(key: key);

  final SignInBloc bloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopLinearProgressIndicator(
      //   backgroundColor: mainColor,
      //   valueColor:accentColor,
      //   stream: bloc.isLoadingStream,
      // ),
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/logo/flutix.png',
              width: 100,
            ),
            const SizedBox(height: 36,),
            Text('Exclusive movies are\nwaiting for you',
              style: blueTitle,
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
              text: "Let's go",
              onTap: () {
                // bloc.setLoading()
              },
            ),
            const SizedBox(height: 36,),
            Row(
              children: [
                Text("Don't have account ? ",
                  style: blackSubtitle,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/signup'),
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