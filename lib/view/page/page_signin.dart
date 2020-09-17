part of 'page.dart';

class SignInPage extends Page<SignInBloc> {
  SignInPage({Key key}) : super(key: key);

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: TopLinearProgressIndicator(
          backgroundColor: mainColor,
          valueColor:accentColor,
          stream: bloc.isLoadingStream,
        ),
        body: Builder(
          builder: (contextScaffold) => SingleChildScrollView(
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
                XTextField(
                  controller: _emailText,
                  text: 'Email',
                ),
                const SizedBox(height: 36,),
                XTextField(
                  obscureText: true,
                  controller: _passwordText,
                  text: 'Password',
                ),
                const SizedBox(height: 36,),
                BlueRectButton(
                  text: "Let's go",
                  onTap: () async {

                    final bool isValidEmail = _emailText.text.contains(
                      RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                    ); 

                    final bool isValidPassword = _passwordText.text.length >= 6; 

                    if (isValidEmail && isValidPassword) {
                      await bloc.signIn(
                        _emailText.text, _passwordText.text)
                        .then((value) {
                          if (value == 'User Active') {
                            Navigator.pushReplacementNamed(context, '/');
                          }
                          else {
                            Scaffold.of(contextScaffold).showSnackBar(snackBar(
                              contentText: value,
                              labelText: 'DISMISS',
                              onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                            ));
                          }
                        }
                      );
                    } else {
                      Scaffold.of(contextScaffold).showSnackBar(snackBar(
                        contentText: 'Email or password not valid',
                        labelText: 'DISMISS',
                        onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                      ));
                    }
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
          ),
        ) 
      ),
    );
  }

}