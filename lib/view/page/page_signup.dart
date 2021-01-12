part of 'page.dart';

class SignUpPage extends Page<SignUpBloc> {
  SignUpPage({Key key}) : super(key: key);

  final TextEditingController _nameText = TextEditingController();
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: TopLinearProgressIndicator(
          backgroundColor: mainColor,
          valueColor: accentColor,
          stream: bloc.isLoadingStream,
        ),
        body: Builder(
          builder: (contextScaffold) => SingleChildScrollView(
          padding: paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Let's start your\nexperience now",
                style: blueTitle,
              ),
              const SizedBox(height: 36,),
              XTextField(
                controller: _nameText,
                text: 'Name',
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
                text: "Let's start",
                onTap: () async {

                  // final bool isValidEmail = _emailText.text.contains(
                  //   RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                  // ); 

                  // final bool isValidPassword = _passwordText.text.length >= 6; 

                  // if (isValidEmail && isValidPassword) {
                  //   await bloc.signUp(
                  //     _nameText.text, _emailText.text, _passwordText.text)
                  //     .then((value) {
                  //       if (value == 'User added') {
                          Navigator.pushReplacementNamed(context, '/preference');
                  //       } else {
                  //         Scaffold.of(contextScaffold).showSnackBar(snackBar(
                  //           contentText: value,
                  //           labelText: 'DISMISS',
                  //           onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                  //         ));
                  //       }
                  //     });
                  // } else {
                  //   Scaffold.of(contextScaffold).showSnackBar(snackBar(
                  //     contentText: 'Email or password not valid',
                  //     labelText: 'DISMISS',
                  //     onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                  //   ));
                  // }
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
                      child: Text('Enter now',
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

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}