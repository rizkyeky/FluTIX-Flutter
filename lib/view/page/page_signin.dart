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
              XTextField(
                controller: _emailText,
                text: 'Email',
              ),
              const SizedBox(height: 36,),
              XTextField(
                controller: _passwordText,
                text: 'Password',
              ),
              const SizedBox(height: 36,),
              BlueRectButton(
                text: "Let's go",
                onTap: () async{
                  await bloc.signIn(_emailText.text, _passwordText.text);
                  print('tap');
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
      ),
    );
  }

}